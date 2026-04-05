namespace CompuPalace.Domain.Entities;

public class UsbPort
{
    public int Id { get; set; }
    public int ComputerId { get; set; }
    public int Count { get; set; }
    public string UsbType { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public Computer Computer { get; set; } = null!;
}
