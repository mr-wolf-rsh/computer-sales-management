using CompuPalace.Domain.Enums;

namespace CompuPalace.Domain.Entities;

public class Computer
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public int RamAmountMB { get; set; }
    public decimal Price { get; set; }
    public string? ImageUrl { get; set; }
    public decimal Weight { get; set; }
    public WeightUnit WeightUnit { get; set; }
    public int PsuWattage { get; set; }
    public int ProcessorId { get; set; }
    public int GpuId { get; set; }
    public string Status { get; set; } = "New";
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }

    public Processor Processor { get; set; } = null!;
    public Gpu Gpu { get; set; } = null!;
    public ICollection<StorageDrive> StorageDrives { get; set; } = new List<StorageDrive>();
    public ICollection<UsbPort> UsbPorts { get; set; } = new List<UsbPort>();
}
