using CompuPalace.Application.DTOs;
using CompuPalace.Domain.Entities;
using Riok.Mapperly.Abstractions;

namespace CompuPalace.Application.Mappings;

[Mapper]
public partial class ComputerMapper : IComputerMapper
{
    [MapProperty(nameof(Computer.Processor) + "." + nameof(Processor.Name), nameof(ComputerDto.ProcessorName))]
    [MapProperty(nameof(Computer.Processor) + "." + nameof(Processor.Brand), nameof(ComputerDto.ProcessorBrand))]
    [MapProperty(nameof(Computer.Gpu) + "." + nameof(Gpu.Name), nameof(ComputerDto.GpuName))]
    [MapProperty(nameof(Computer.Gpu) + "." + nameof(Gpu.Brand), nameof(ComputerDto.GpuBrand))]
    [MapperIgnoreTarget(nameof(ComputerDto.TierBadge))]
    [MapperIgnoreTarget(nameof(ComputerDto.IsNew))]
    private partial ComputerDto MapComputerToDto(Computer computer);

    public ComputerDto ComputerToDto(Computer computer)
    {
        var dto = MapComputerToDto(computer);
        dto.IsNew = computer.Status == "New" && computer.CreatedAt >= DateTime.UtcNow.AddDays(-15);
        return dto;
    }

    public List<ComputerDto> ComputersToDto(List<Computer> computers)
        => computers.Select(ComputerToDto).ToList();

    [MapperIgnoreSource(nameof(StorageDrive.ComputerId))]
    [MapperIgnoreSource(nameof(StorageDrive.CreatedAt))]
    [MapperIgnoreSource(nameof(StorageDrive.Computer))]
    public partial StorageDriveDto StorageDriveToDto(StorageDrive storageDrive);

    [MapperIgnoreSource(nameof(UsbPort.ComputerId))]
    [MapperIgnoreSource(nameof(UsbPort.CreatedAt))]
    [MapperIgnoreSource(nameof(UsbPort.Computer))]
    public partial UsbPortDto UsbPortToDto(UsbPort usbPort);

    [MapperIgnoreSource(nameof(Processor.CreatedAt))]
    [MapperIgnoreSource(nameof(Processor.Computers))]
    public partial ProcessorDto ProcessorToDto(Processor processor);

    public partial List<ProcessorDto> ProcessorsToDto(List<Processor> processors);

    [MapperIgnoreSource(nameof(Gpu.CreatedAt))]
    [MapperIgnoreSource(nameof(Gpu.Computers))]
    public partial GpuDto GpuToDto(Gpu gpu);

    public partial List<GpuDto> GpusToDto(List<Gpu> gpus);

}
