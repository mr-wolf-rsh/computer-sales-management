namespace CompuPalace.Application.DTOs;

public class ComputerDto
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public int RamAmountMB { get; set; }
    public decimal Price { get; set; }
    public string? ImageUrl { get; set; }
    public decimal Weight { get; set; }
    public string WeightUnit { get; set; } = string.Empty;
    public int PsuWattage { get; set; }
    public int ProcessorId { get; set; }
    public string ProcessorName { get; set; } = string.Empty;
    public string ProcessorBrand { get; set; } = string.Empty;
    public int GpuId { get; set; }
    public string GpuName { get; set; } = string.Empty;
    public string GpuBrand { get; set; } = string.Empty;
    public List<StorageDriveDto> StorageDrives { get; set; } = new();
    public List<UsbPortDto> UsbPorts { get; set; } = new();
    public string TierBadge { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public bool IsNew { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
