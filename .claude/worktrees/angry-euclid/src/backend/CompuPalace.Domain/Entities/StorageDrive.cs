using CompuPalace.Domain.Enums;

namespace CompuPalace.Domain.Entities;

public class StorageDrive
{
    public int Id { get; set; }
    public int ComputerId { get; set; }
    public int CapacityGB { get; set; }
    public StorageDriveType Type { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public Computer Computer { get; set; } = null!;
}
