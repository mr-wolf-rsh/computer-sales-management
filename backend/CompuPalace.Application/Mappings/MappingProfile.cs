using AutoMapper;
using CompuPalace.Application.DTOs;
using CompuPalace.Domain.Entities;

namespace CompuPalace.Application.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        CreateMap<Computer, ComputerDto>()
            .ForMember(dest => dest.WeightUnit, opt => opt.MapFrom(src => src.WeightUnit.ToString()))
            .ForMember(dest => dest.ProcessorName, opt => opt.MapFrom(src => src.Processor.Name))
            .ForMember(dest => dest.ProcessorBrand, opt => opt.MapFrom(src => src.Processor.Brand))
            .ForMember(dest => dest.GpuName, opt => opt.MapFrom(src => src.Gpu.Name))
            .ForMember(dest => dest.GpuBrand, opt => opt.MapFrom(src => src.Gpu.Brand))
            .ForMember(dest => dest.IsNew, opt => opt.MapFrom(src =>
                src.Status == "New" && src.CreatedAt >= DateTime.UtcNow.AddDays(-15)));

        CreateMap<StorageDrive, StorageDriveDto>()
            .ForMember(dest => dest.Type, opt => opt.MapFrom(src => src.Type.ToString()));

        CreateMap<UsbPort, UsbPortDto>();

        CreateMap<Processor, ProcessorDto>();
        CreateMap<Gpu, GpuDto>();
    }
}
