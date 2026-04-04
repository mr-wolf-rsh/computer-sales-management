using CompuPalace.Application.Interfaces;
using CompuPalace.Domain.Entities;
using CompuPalace.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace CompuPalace.Infrastructure.Repositories;

public class GpuRepository : IGpuRepository
{
    private readonly AppDbContext _context;

    public GpuRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<List<Gpu>> GetAllAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Gpus
            .OrderBy(g => g.Brand)
            .ThenBy(g => g.Name)
            .AsNoTracking()
            .ToListAsync(cancellationToken);
    }

    public async Task<Gpu?> GetByIdAsync(int id, CancellationToken cancellationToken = default)
    {
        return await _context.Gpus.FindAsync(new object[] { id }, cancellationToken);
    }

    public async Task<Gpu> GetOrCreateAsync(string name, string brand, CancellationToken cancellationToken = default)
    {
        var existing = await _context.Gpus
            .FirstOrDefaultAsync(g => g.Name == name && g.Brand == brand, cancellationToken);

        if (existing is not null)
            return existing;

        var gpu = new Gpu
        {
            Name = name,
            Brand = brand,
            CreatedAt = DateTime.UtcNow
        };

        await _context.Gpus.AddAsync(gpu, cancellationToken);
        await _context.SaveChangesAsync(cancellationToken);

        return gpu;
    }
}
