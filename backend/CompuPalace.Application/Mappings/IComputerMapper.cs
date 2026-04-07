using CompuPalace.Application.DTOs;
using CompuPalace.Domain.Entities;

namespace CompuPalace.Application.Mappings;

public interface IComputerMapper
{
    ComputerDto ComputerToDto(Computer computer);
    List<ComputerDto> ComputersToDto(List<Computer> computers);
    StorageDriveDto StorageDriveToDto(StorageDrive storageDrive);
    UsbPortDto UsbPortToDto(UsbPort usbPort);
    ProcessorDto ProcessorToDto(Processor processor);
    List<ProcessorDto> ProcessorsToDto(List<Processor> processors);
    GpuDto GpuToDto(Gpu gpu);
    List<GpuDto> GpusToDto(List<Gpu> gpus);
}
