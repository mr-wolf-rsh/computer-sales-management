namespace CompuPalace.Application.DTOs;

public class ComputerUpdateDto
{
    public string Name { get; set; } = string.Empty;
    public int RamAmountMB { get; set; }
    public decimal Price { get; set; }
    public string? ImageUrl { get; set; }
    public decimal Weight { get; set; }
    public string WeightUnit { get; set; } = string.Empty;
    public int PsuWattage { get; set; }
    public string ProcessorName { get; set; } = string.Empty;
    public string ProcessorBrand { get; set; } = string.Empty;
    public string GpuName { get; set; } = string.Empty;
    public string GpuBrand { get; set; } = string.Empty;
    public List<StorageDriveCreateDto> StorageDrives { get; set; } = new();
    public List<UsbPortCreateDto> UsbPorts { get; set; } = new();
}
