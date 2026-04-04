using CompuPalace.Application.DTOs;
using FluentValidation;

namespace CompuPalace.Application.Validators;

public class ComputerCreateValidator : AbstractValidator<ComputerCreateDto>
{
    public ComputerCreateValidator()
    {
        RuleFor(x => x.Name)
            .NotEmpty().WithMessage("Name is required.")
            .MaximumLength(200).WithMessage("Name must not exceed 200 characters.");

        RuleFor(x => x.RamAmountMB)
            .GreaterThan(0).WithMessage("RAM amount must be greater than 0.");

        RuleFor(x => x.Price)
            .GreaterThan(0).WithMessage("Price must be greater than 0.");

        RuleFor(x => x.Weight)
            .GreaterThan(0).WithMessage("Weight must be greater than 0.");

        RuleFor(x => x.WeightUnit)
            .NotEmpty().WithMessage("Weight unit is required.")
            .Must(x => x.Equals("Kg", StringComparison.OrdinalIgnoreCase) ||
                       x.Equals("Lb", StringComparison.OrdinalIgnoreCase))
            .WithMessage("Weight unit must be 'Kg' or 'Lb'.");

        RuleFor(x => x.PsuWattage)
            .GreaterThan(0).WithMessage("PSU wattage must be greater than 0.");

        RuleFor(x => x.ProcessorName)
            .NotEmpty().WithMessage("Processor name is required.");

        RuleFor(x => x.ProcessorBrand)
            .NotEmpty().WithMessage("Processor brand is required.");

        RuleFor(x => x.GpuName)
            .NotEmpty().WithMessage("GPU name is required.");

        RuleFor(x => x.GpuBrand)
            .NotEmpty().WithMessage("GPU brand is required.");

        RuleFor(x => x.StorageDrives)
            .NotEmpty().WithMessage("At least one storage drive is required.");

        RuleForEach(x => x.StorageDrives).ChildRules(drive =>
        {
            drive.RuleFor(x => x.CapacityGB)
                .GreaterThan(0).WithMessage("Storage drive capacity must be greater than 0.");

            drive.RuleFor(x => x.Type)
                .NotEmpty().WithMessage("Storage drive type is required.")
                .Must(x => x.Equals("SSD", StringComparison.OrdinalIgnoreCase) ||
                           x.Equals("HDD", StringComparison.OrdinalIgnoreCase))
                .WithMessage("Storage drive type must be 'SSD' or 'HDD'.");
        });

        RuleForEach(x => x.UsbPorts).ChildRules(port =>
        {
            port.RuleFor(x => x.Count)
                .GreaterThan(0).WithMessage("USB port count must be greater than 0.");

            port.RuleFor(x => x.UsbType)
                .NotEmpty().WithMessage("USB type is required.");
        });
    }
}
