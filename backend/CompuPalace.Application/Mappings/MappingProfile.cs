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
    public partial ComputerDto ComputerToDto(Computer computer);

    public partial List<ComputerDto> ComputersToDto(List<Computer> computers);

    public partial StorageDriveDto StorageDriveToDto(StorageDrive storageDrive);

    public partial UsbPortDto UsbPortToDto(UsbPort usbPort);

    public partial ProcessorDto ProcessorToDto(Processor processor);

    public partial List<ProcessorDto> ProcessorsToDto(List<Processor> processors);

    public partial GpuDto GpuToDto(Gpu gpu);

    public partial List<GpuDto> GpusToDto(List<Gpu> gpus);

    private string WeightUnitToString(Domain.Enums.WeightUnit weightUnit) => weightUnit.ToString();

    private string StorageDriveTypeToString(Domain.Enums.StorageDriveType type) => type.ToString();

    [AfterMap]
    private static void AfterMapComputer(Computer source, ComputerDto target)
    {
        target.IsNew = source.Status == "New" && source.CreatedAt >= DateTime.UtcNow.AddDays(-15);
    }
}
