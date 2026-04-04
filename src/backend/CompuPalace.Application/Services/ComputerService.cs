using AutoMapper;
using CompuPalace.Application.DTOs;
using CompuPalace.Application.Interfaces;
using CompuPalace.Domain.Entities;
using CompuPalace.Domain.Enums;
using FluentValidation;

namespace CompuPalace.Application.Services;

public class ComputerService : IComputerService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly IValidator<ComputerCreateDto> _createValidator;
    private readonly IValidator<ComputerUpdateDto> _updateValidator;

    public ComputerService(
        IUnitOfWork unitOfWork,
        IMapper mapper,
        IValidator<ComputerCreateDto> createValidator,
        IValidator<ComputerUpdateDto> updateValidator)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _createValidator = createValidator;
        _updateValidator = updateValidator;
    }

    public async Task<PaginatedResult<ComputerDto>> GetPagedAsync(int page, int pageSize, CancellationToken cancellationToken = default)
    {
        var result = await _unitOfWork.Computers.GetPagedAsync(page, pageSize, cancellationToken);
        var dtos = _mapper.Map<List<ComputerDto>>(result.Items);

        foreach (var dto in dtos)
        {
            dto.TierBadge = CalculateTierBadge(dto);
        }

        return new PaginatedResult<ComputerDto>
        {
            Items = dtos,
            TotalCount = result.TotalCount,
            Page = result.Page,
            PageSize = result.PageSize
        };
    }

    public async Task<ComputerDto?> GetByIdAsync(int id, CancellationToken cancellationToken = default)
    {
        var computer = await _unitOfWork.Computers.GetByIdAsync(id, cancellationToken);
        if (computer is null) return null;

        var dto = _mapper.Map<ComputerDto>(computer);
        dto.TierBadge = CalculateTierBadge(dto);
        return dto;
    }

    public async Task<PaginatedResult<ComputerDto>> SearchAsync(string query, int page, int pageSize, CancellationToken cancellationToken = default)
    {
        var result = await _unitOfWork.Computers.SearchAsync(query, page, pageSize, cancellationToken);
        var dtos = _mapper.Map<List<ComputerDto>>(result.Items);

        foreach (var dto in dtos)
        {
            dto.TierBadge = CalculateTierBadge(dto);
        }

        return new PaginatedResult<ComputerDto>
        {
            Items = dtos,
            TotalCount = result.TotalCount,
            Page = result.Page,
            PageSize = result.PageSize
        };
    }

    public async Task<ComputerDto> CreateAsync(ComputerCreateDto dto, CancellationToken cancellationToken = default)
    {
        var validationResult = await _createValidator.ValidateAsync(dto, cancellationToken);
        if (!validationResult.IsValid)
        {
            throw new ValidationException(validationResult.Errors);
        }

        var processor = await _unitOfWork.Processors.GetOrCreateAsync(dto.ProcessorName, dto.ProcessorBrand, cancellationToken);
        var gpu = await _unitOfWork.Gpus.GetOrCreateAsync(dto.GpuName, dto.GpuBrand, cancellationToken);

        var computer = new Computer
        {
            Name = dto.Name,
            RamAmountMB = dto.RamAmountMB,
            Price = dto.Price,
            ImageUrl = dto.ImageUrl,
            Weight = dto.Weight,
            WeightUnit = Enum.Parse<WeightUnit>(dto.WeightUnit, ignoreCase: true),
            PsuWattage = dto.PsuWattage,
            ProcessorId = processor.Id,
            GpuId = gpu.Id,
            CreatedAt = DateTime.UtcNow,
            StorageDrives = dto.StorageDrives.Select(sd => new StorageDrive
            {
                CapacityGB = sd.CapacityGB,
                Type = Enum.Parse<StorageDriveType>(sd.Type, ignoreCase: true),
                CreatedAt = DateTime.UtcNow
            }).ToList(),
            UsbPorts = dto.UsbPorts.Select(up => new UsbPort
            {
                Count = up.Count,
                UsbType = up.UsbType,
                CreatedAt = DateTime.UtcNow
            }).ToList()
        };

        var created = await _unitOfWork.Computers.CreateAsync(computer, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        var result = _mapper.Map<ComputerDto>(created);
        result.TierBadge = CalculateTierBadge(result);
        return result;
    }

    public async Task<ComputerDto?> UpdateAsync(int id, ComputerUpdateDto dto, CancellationToken cancellationToken = default)
    {
        var validationResult = await _updateValidator.ValidateAsync(dto, cancellationToken);
        if (!validationResult.IsValid)
        {
            throw new ValidationException(validationResult.Errors);
        }

        var existing = await _unitOfWork.Computers.GetByIdAsync(id, cancellationToken);
        if (existing is null) return null;

        var processor = await _unitOfWork.Processors.GetOrCreateAsync(dto.ProcessorName, dto.ProcessorBrand, cancellationToken);
        var gpu = await _unitOfWork.Gpus.GetOrCreateAsync(dto.GpuName, dto.GpuBrand, cancellationToken);

        existing.Name = dto.Name;
        existing.RamAmountMB = dto.RamAmountMB;
        existing.Price = dto.Price;
        existing.ImageUrl = dto.ImageUrl;
        existing.Weight = dto.Weight;
        existing.WeightUnit = Enum.Parse<WeightUnit>(dto.WeightUnit, ignoreCase: true);
        existing.PsuWattage = dto.PsuWattage;
        existing.ProcessorId = processor.Id;
        existing.GpuId = gpu.Id;
        existing.UpdatedAt = DateTime.UtcNow;

        existing.StorageDrives.Clear();
        foreach (var sd in dto.StorageDrives)
        {
            existing.StorageDrives.Add(new StorageDrive
            {
                CapacityGB = sd.CapacityGB,
                Type = Enum.Parse<StorageDriveType>(sd.Type, ignoreCase: true),
                CreatedAt = DateTime.UtcNow
            });
        }

        existing.UsbPorts.Clear();
        foreach (var up in dto.UsbPorts)
        {
            existing.UsbPorts.Add(new UsbPort
            {
                Count = up.Count,
                UsbType = up.UsbType,
                CreatedAt = DateTime.UtcNow
            });
        }

        var updated = await _unitOfWork.Computers.UpdateAsync(existing, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        var result = _mapper.Map<ComputerDto>(updated);
        result.TierBadge = CalculateTierBadge(result);
        return result;
    }

    public async Task<bool> DeleteAsync(int id, CancellationToken cancellationToken = default)
    {
        var existing = await _unitOfWork.Computers.GetByIdAsync(id, cancellationToken);
        if (existing is null) return false;

        await _unitOfWork.Computers.DeleteAsync(id, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<DashboardStatsDto> GetDashboardStatsAsync(CancellationToken cancellationToken = default)
    {
        return await _unitOfWork.Computers.GetDashboardStatsAsync(cancellationToken);
    }

    public static string CalculateTierBadge(ComputerDto computer)
    {
        var totalStorageGB = computer.StorageDrives.Sum(sd => sd.CapacityGB);
        var score =
            (computer.RamAmountMB / 1024.0) * 0.3 +
            (totalStorageGB / 1000.0) * 0.2 +
            ((double)computer.Price / 200.0) * 0.3 +
            (computer.PsuWattage / 100.0) * 0.2;

        return score switch
        {
            < 3 => "Page",
            < 5 => "Squire",
            < 7 => "Knight",
            < 9 => "Baron",
            < 11 => "Duke",
            < 13 => "Prince",
            _ => "Sovereign"
        };
    }
}
