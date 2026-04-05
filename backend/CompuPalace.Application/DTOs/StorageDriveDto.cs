namespace CompuPalace.Application.DTOs;

public class StorageDriveDto
{
    public int Id { get; set; }
    public int CapacityGB { get; set; }
    public string Type { get; set; } = string.Empty;
}
