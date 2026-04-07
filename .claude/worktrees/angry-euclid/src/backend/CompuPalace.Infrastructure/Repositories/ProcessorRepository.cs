using CompuPalace.Application.Interfaces;
using CompuPalace.Domain.Entities;
using CompuPalace.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace CompuPalace.Infrastructure.Repositories;

public class ProcessorRepository : IProcessorRepository
{
    private readonly AppDbContext _context;

    public ProcessorRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<List<Processor>> GetAllAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Processors
            .OrderBy(p => p.Brand)
            .ThenBy(p => p.Name)
            .AsNoTracking()
            .ToListAsync(cancellationToken);
    }

    public async Task<Processor?> GetByIdAsync(int id, CancellationToken cancellationToken = default)
    {
        return await _context.Processors.FindAsync(new object[] { id }, cancellationToken);
    }

    public async Task<Processor> GetOrCreateAsync(string name, string brand, CancellationToken cancellationToken = default)
    {
        var existing = await _context.Processors
            .FirstOrDefaultAsync(p => p.Name == name && p.Brand == brand, cancellationToken);

        if (existing is not null)
            return existing;

        var processor = new Processor
        {
            Name = name,
            Brand = brand,
            CreatedAt = DateTime.UtcNow
        };

        await _context.Processors.AddAsync(processor, cancellationToken);
        await _context.SaveChangesAsync(cancellationToken);

        return processor;
    }
}
