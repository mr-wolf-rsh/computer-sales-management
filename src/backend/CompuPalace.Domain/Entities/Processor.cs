namespace CompuPalace.Domain.Entities;

public class Processor
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Brand { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public ICollection<Computer> Computers { get; set; } = new List<Computer>();
}
