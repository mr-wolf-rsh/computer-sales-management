using CompuPalace.Application.DTOs;
using CompuPalace.Application.Validators;
using FluentAssertions;

namespace CompuPalace.Tests.Unit.Validators;

public class ComputerCreateValidatorTests
{
    private readonly ComputerCreateValidator _validator = new();

    private static ComputerCreateDto CreateValidDto()
    {
        return new ComputerCreateDto
        {
            Name = "Test Computer",
            RamAmountMB = 16384,
            Price = 1299.99m,
            Weight = 2.1m,
            WeightUnit = "Kg",
            PsuWattage = 650,
            ProcessorName = "Core i7-12700H",
            ProcessorBrand = "Intel",
            GpuName = "RTX 4060",
            GpuBrand = "NVIDIA",
            StorageDrives = new List<StorageDriveCreateDto>
            {
                new() { CapacityGB = 512, Type = "SSD" }
            },
            UsbPorts = new List<UsbPortCreateDto>
            {
                new() { Count = 2, UsbType = "USB-C" }
            }
        };
    }

    [Fact]
    public async Task Validate_WithValidDto_ShouldPass()
    {
        var dto = CreateValidDto();
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeTrue();
    }

    [Fact]
    public async Task Validate_WithEmptyName_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.Name = "";
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "Name");
    }

    [Fact]
    public async Task Validate_WithNameTooLong_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.Name = new string('A', 201);
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "Name");
    }

    [Fact]
    public async Task Validate_WithZeroRam_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.RamAmountMB = 0;
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "RamAmountMB");
    }

    [Fact]
    public async Task Validate_WithNegativePrice_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.Price = -100;
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "Price");
    }

    [Fact]
    public async Task Validate_WithZeroWeight_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.Weight = 0;
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "Weight");
    }

    [Fact]
    public async Task Validate_WithInvalidWeightUnit_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.WeightUnit = "ounces";
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "WeightUnit");
    }

    [Theory]
    [InlineData("Kg")]
    [InlineData("Lb")]
    [InlineData("kg")]
    [InlineData("lb")]
    public async Task Validate_WithValidWeightUnit_ShouldPass(string weightUnit)
    {
        var dto = CreateValidDto();
        dto.WeightUnit = weightUnit;
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeTrue();
    }

    [Fact]
    public async Task Validate_WithZeroPsuWattage_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.PsuWattage = 0;
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "PsuWattage");
    }

    [Fact]
    public async Task Validate_WithEmptyStorageDrives_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.StorageDrives = new List<StorageDriveCreateDto>();
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "StorageDrives");
    }

    [Fact]
    public async Task Validate_WithInvalidStorageDriveType_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.StorageDrives = new List<StorageDriveCreateDto>
        {
            new() { CapacityGB = 512, Type = "NVMe" }
        };
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
    }

    [Fact]
    public async Task Validate_WithZeroStorageCapacity_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.StorageDrives = new List<StorageDriveCreateDto>
        {
            new() { CapacityGB = 0, Type = "SSD" }
        };
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
    }

    [Fact]
    public async Task Validate_WithEmptyUsbType_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.UsbPorts = new List<UsbPortCreateDto>
        {
            new() { Count = 2, UsbType = "" }
        };
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
    }

    [Fact]
    public async Task Validate_WithZeroUsbPortCount_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.UsbPorts = new List<UsbPortCreateDto>
        {
            new() { Count = 0, UsbType = "USB-C" }
        };
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
    }

    [Fact]
    public async Task Validate_WithEmptyProcessorName_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.ProcessorName = "";
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "ProcessorName");
    }

    [Fact]
    public async Task Validate_WithEmptyGpuBrand_ShouldFail()
    {
        var dto = CreateValidDto();
        dto.GpuBrand = "";
        var result = await _validator.ValidateAsync(dto);
        result.IsValid.Should().BeFalse();
        result.Errors.Should().Contain(e => e.PropertyName == "GpuBrand");
    }
}
