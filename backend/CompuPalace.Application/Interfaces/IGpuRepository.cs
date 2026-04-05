using CompuPalace.Domain.Entities;

namespace CompuPalace.Application.Interfaces;

public interface IGpuRepository
{
    Task<List<Gpu>> GetAllAsync(CancellationToken cancellationToken = default);
    Task<Gpu?> GetByIdAsync(int id, CancellationToken cancellationToken = default);
    Task<Gpu> GetOrCreateAsync(string name, string brand, CancellationToken cancellationToken = default);
}
