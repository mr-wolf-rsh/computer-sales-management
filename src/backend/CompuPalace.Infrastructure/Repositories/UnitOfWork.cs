using CompuPalace.Application.Interfaces;
using CompuPalace.Infrastructure.Data;

namespace CompuPalace.Infrastructure.Repositories;

public class UnitOfWork : IUnitOfWork
{
    private readonly AppDbContext _context;
    private IComputerRepository? _computers;
    private IProcessorRepository? _processors;
    private IGpuRepository? _gpus;

    public UnitOfWork(AppDbContext context)
    {
        _context = context;
    }

    public IComputerRepository Computers =>
        _computers ??= new ComputerRepository(_context);

    public IProcessorRepository Processors =>
        _processors ??= new ProcessorRepository(_context);

    public IGpuRepository Gpus =>
        _gpus ??= new GpuRepository(_context);

    public async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.SaveChangesAsync(cancellationToken);
    }

    public void Dispose()
    {
        _context.Dispose();
    }
}
