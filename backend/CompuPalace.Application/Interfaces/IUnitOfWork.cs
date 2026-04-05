namespace CompuPalace.Application.Interfaces;

public interface IUnitOfWork : IDisposable
{
    IComputerRepository Computers { get; }
    IProcessorRepository Processors { get; }
    IGpuRepository Gpus { get; }
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}
