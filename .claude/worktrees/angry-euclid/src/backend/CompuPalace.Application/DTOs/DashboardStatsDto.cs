namespace CompuPalace.Application.DTOs;

public class DashboardStatsDto
{
    public int TotalComputers { get; set; }
    public decimal AvgPrice { get; set; }
    public double AvgRam { get; set; }
    public decimal MinPrice { get; set; }
    public decimal MaxPrice { get; set; }
    public Dictionary<string, int> StorageDistribution { get; set; } = new();
    public Dictionary<string, int> GpuBrandDistribution { get; set; } = new();
}
