using CompuPalace.Application.DTOs;
using CompuPalace.Domain.Entities;

namespace CompuPalace.Application.Interfaces;

public interface IComputerRepository
{
    Task<PaginatedResult<Computer>> GetPagedAsync(int page, int pageSize, string sortBy = "createdAt", string sortOrder = "desc", CancellationToken cancellationToken = default);
    Task<Computer?> GetByIdAsync(int id, CancellationToken cancellationToken = default);
    Task<PaginatedResult<Computer>> SearchAsync(string query, int page, int pageSize, string sortBy = "createdAt", string sortOrder = "desc", CancellationToken cancellationToken = default);
    Task<Computer> CreateAsync(Computer computer, CancellationToken cancellationToken = default);
    Task<Computer> UpdateAsync(Computer computer, CancellationToken cancellationToken = default);
    Task DeleteAsync(int id, CancellationToken cancellationToken = default);
    Task<DashboardStatsDto> GetDashboardStatsAsync(CancellationToken cancellationToken = default);
}
