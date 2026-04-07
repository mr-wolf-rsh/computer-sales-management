using CompuPalace.Application.DTOs;
using CompuPalace.Application.Interfaces;
using CompuPalace.Application.Mappings;
using CompuPalace.Application.Services;
using CompuPalace.Application.Validators;
using CompuPalace.Domain.Entities;
using CompuPalace.Domain.Enums;
using FluentAssertions;
using FluentValidation;
using Moq;

namespace CompuPalace.Tests.Unit.Services;

public class ComputerServiceTests
{
    private readonly Mock<IUnitOfWork> _unitOfWorkMock;
    private readonly Mock<IComputerRepository> _computerRepoMock;
    private readonly Mock<IProcessorRepository> _processorRepoMock;
    private readonly Mock<IGpuRepository> _gpuRepoMock;
    private readonly IComputerMapper _mapper;
    private readonly IValidator<ComputerCreateDto> _createValidator;
    private readonly IValidator<ComputerUpdateDto> _updateValidator;
    private readonly ComputerService _service;

    public ComputerServiceTests()
    {
        _unitOfWorkMock = new Mock<IUnitOfWork>();
        _computerRepoMock = new Mock<IComputerRepository>();
        _processorRepoMock = new Mock<IProcessorRepository>();
        _gpuRepoMock = new Mock<IGpuRepository>();

        _unitOfWorkMock.Setup(u => u.Computers).Returns(_computerRepoMock.Object);
        _unitOfWorkMock.Setup(u => u.Processors).Returns(_processorRepoMock.Object);
        _unitOfWorkMock.Setup(u => u.Gpus).Returns(_gpuRepoMock.Object);

        _mapper = new ComputerMapper();

        _createValidator = new ComputerCreateValidator();
        _updateValidator = new ComputerUpdateValidator();

        _service = new ComputerService(
            _unitOfWorkMock.Object,
            _mapper,
            _createValidator,
            _updateValidator);
    }

    [Fact]
    public async Task GetByIdAsync_WhenComputerExists_ReturnsComputerDto()
    {
        // Arrange
        var computer = CreateSampleComputer(1);
        _computerRepoMock.Setup(r => r.GetByIdAsync(1, It.IsAny<CancellationToken>()))
            .ReturnsAsync(computer);

        // Act
        var result = await _service.GetByIdAsync(1);

        // Assert
        result.Should().NotBeNull();
        result!.Id.Should().Be(1);
        result.Name.Should().Be("Test Computer");
        result.ProcessorName.Should().Be("Core i7-12700H");
        result.GpuName.Should().Be("RTX 4060");
        result.TierBadge.Should().NotBeNullOrEmpty();
    }

    [Fact]
    public async Task GetByIdAsync_WhenComputerDoesNotExist_ReturnsNull()
    {
        // Arrange
        _computerRepoMock.Setup(r => r.GetByIdAsync(999, It.IsAny<CancellationToken>()))
            .ReturnsAsync((Computer?)null);

        // Act
        var result = await _service.GetByIdAsync(999);

        // Assert
        result.Should().BeNull();
    }

    [Fact]
    public async Task CreateAsync_WithValidDto_ReturnsCreatedComputer()
    {
        // Arrange
        var createDto = CreateSampleCreateDto();
        var processor = new Processor { Id = 1, Name = "Core i7-12700H", Brand = "Intel" };
        var gpu = new Gpu { Id = 1, Name = "RTX 4060", Brand = "NVIDIA" };

        _processorRepoMock.Setup(r => r.GetOrCreateAsync("Core i7-12700H", "Intel", It.IsAny<CancellationToken>()))
            .ReturnsAsync(processor);
        _gpuRepoMock.Setup(r => r.GetOrCreateAsync("RTX 4060", "NVIDIA", It.IsAny<CancellationToken>()))
            .ReturnsAsync(gpu);
        _computerRepoMock.Setup(r => r.CreateAsync(It.IsAny<Computer>(), It.IsAny<CancellationToken>()))
            .ReturnsAsync((Computer c, CancellationToken _) =>
            {
                c.Id = 1;
                c.Processor = processor;
                c.Gpu = gpu;
                return c;
            });
        _unitOfWorkMock.Setup(u => u.SaveChangesAsync(It.IsAny<CancellationToken>()))
            .ReturnsAsync(1);

        // Act
        var result = await _service.CreateAsync(createDto);

        // Assert
        result.Should().NotBeNull();
        result.Name.Should().Be("Test Computer");
        result.TierBadge.Should().NotBeNullOrEmpty();
        _unitOfWorkMock.Verify(u => u.SaveChangesAsync(It.IsAny<CancellationToken>()), Times.Once);
    }

    [Fact]
    public async Task CreateAsync_WithInvalidDto_ThrowsValidationException()
    {
        // Arrange
        var createDto = new ComputerCreateDto
        {
            Name = "",
            RamAmountMB = -1,
            Price = 0,
            Weight = 0,
            WeightUnit = "invalid",
            PsuWattage = 0,
            ProcessorName = "",
            ProcessorBrand = "",
            GpuName = "",
            GpuBrand = "",
            StorageDrives = new List<StorageDriveCreateDto>()
        };

        // Act
        var act = () => _service.CreateAsync(createDto);

        // Assert
        await act.Should().ThrowAsync<ValidationException>();
    }

    [Fact]
    public async Task DeleteAsync_WhenComputerExists_ReturnsTrue()
    {
        // Arrange
        var computer = CreateSampleComputer(1);
        _computerRepoMock.Setup(r => r.GetByIdAsync(1, It.IsAny<CancellationToken>()))
            .ReturnsAsync(computer);
        _computerRepoMock.Setup(r => r.DeleteAsync(1, It.IsAny<CancellationToken>()))
            .Returns(Task.CompletedTask);
        _unitOfWorkMock.Setup(u => u.SaveChangesAsync(It.IsAny<CancellationToken>()))
            .ReturnsAsync(1);

        // Act
        var result = await _service.DeleteAsync(1);

        // Assert
        result.Should().BeTrue();
    }

    [Fact]
    public async Task DeleteAsync_WhenComputerDoesNotExist_ReturnsFalse()
    {
        // Arrange
        _computerRepoMock.Setup(r => r.GetByIdAsync(999, It.IsAny<CancellationToken>()))
            .ReturnsAsync((Computer?)null);

        // Act
        var result = await _service.DeleteAsync(999);

        // Assert
        result.Should().BeFalse();
    }

    [Theory]
    [InlineData(2048, 256, 200, 300, "Page")]       // Low specs
    [InlineData(8192, 512, 800, 500, "Squire")]      // Mid-low specs
    [InlineData(16384, 1000, 1200, 650, "Knight")]    // Mid specs
    [InlineData(32768, 2000, 1800, 850, "Baron")]     // Mid-high specs
    [InlineData(32768, 2000, 2500, 1000, "Duke")]     // High specs
    [InlineData(65536, 4000, 3000, 1200, "Prince")]   // Very high specs
    [InlineData(131072, 8000, 5000, 1600, "Sovereign")] // Ultra specs
    public void CalculateTierBadge_ReturnsCorrectTier(int ramMB, int storageGB, decimal price, int psuWattage, string expectedTier)
    {
        // Arrange
        var dto = new ComputerDto
        {
            RamAmountMB = ramMB,
            Price = price,
            PsuWattage = psuWattage,
            StorageDrives = new List<StorageDriveDto>
            {
                new() { CapacityGB = storageGB }
            }
        };

        // Act
        var tier = ComputerService.CalculateTierBadge(dto);

        // Assert
        tier.Should().Be(expectedTier);
    }

    [Fact]
    public async Task GetPagedAsync_ReturnsCorrectPaginatedResult()
    {
        // Arrange
        var computers = new List<Computer> { CreateSampleComputer(1), CreateSampleComputer(2) };
        var pagedResult = new PaginatedResult<Computer>
        {
            Items = computers,
            TotalCount = 2,
            Page = 1,
            PageSize = 10
        };

        _computerRepoMock.Setup(r => r.GetPagedAsync(1, 10, It.IsAny<CancellationToken>()))
            .ReturnsAsync(pagedResult);

        // Act
        var result = await _service.GetPagedAsync(1, 10);

        // Assert
        result.Items.Should().HaveCount(2);
        result.TotalCount.Should().Be(2);
        result.Page.Should().Be(1);
        result.PageSize.Should().Be(10);
    }

    private static Computer CreateSampleComputer(int id)
    {
        return new Computer
        {
            Id = id,
            Name = "Test Computer",
            RamAmountMB = 16384,
            Price = 1299.99m,
            ImageUrl = "https://example.com/computer.jpg",
            Weight = 2.1m,
            WeightUnit = WeightUnit.Kg,
            PsuWattage = 650,
            ProcessorId = 1,
            GpuId = 1,
            CreatedAt = DateTime.UtcNow,
            Processor = new Processor { Id = 1, Name = "Core i7-12700H", Brand = "Intel" },
            Gpu = new Gpu { Id = 1, Name = "RTX 4060", Brand = "NVIDIA" },
            StorageDrives = new List<StorageDrive>
            {
                new() { Id = 1, CapacityGB = 512, Type = StorageDriveType.SSD, ComputerId = id },
                new() { Id = 2, CapacityGB = 1000, Type = StorageDriveType.HDD, ComputerId = id }
            },
            UsbPorts = new List<UsbPort>
            {
                new() { Id = 1, Count = 2, UsbType = "USB-C", ComputerId = id },
                new() { Id = 2, Count = 3, UsbType = "USB-A 3.0", ComputerId = id }
            }
        };
    }

    private static ComputerCreateDto CreateSampleCreateDto()
    {
        return new ComputerCreateDto
        {
            Name = "Test Computer",
            RamAmountMB = 16384,
            Price = 1299.99m,
            ImageUrl = "https://example.com/computer.jpg",
            Weight = 2.1m,
            WeightUnit = "Kg",
            PsuWattage = 650,
            ProcessorName = "Core i7-12700H",
            ProcessorBrand = "Intel",
            GpuName = "RTX 4060",
            GpuBrand = "NVIDIA",
            StorageDrives = new List<StorageDriveCreateDto>
            {
                new() { CapacityGB = 512, Type = "SSD" },
                new() { CapacityGB = 1000, Type = "HDD" }
            },
            UsbPorts = new List<UsbPortCreateDto>
            {
                new() { Count = 2, UsbType = "USB-C" },
                new() { Count = 3, UsbType = "USB-A 3.0" }
            }
        };
    }
}
