using CompuPalace.Domain.Entities;

namespace CompuPalace.Application.Interfaces;

public interface IProcessorRepository
{
    Task<List<Processor>> GetAllAsync(CancellationToken cancellationToken = default);
    Task<Processor?> GetByIdAsync(int id, CancellationToken cancellationToken = default);
    Task<Processor> GetOrCreateAsync(string name, string brand, CancellationToken cancellationToken = default);
}
