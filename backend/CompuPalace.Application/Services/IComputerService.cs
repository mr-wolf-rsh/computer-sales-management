using CompuPalace.Application.DTOs;

namespace CompuPalace.Application.Services;

public interface IComputerService
{
    Task<PaginatedResult<ComputerDto>> GetPagedAsync(int page, int pageSize, string sortBy = "createdAt", string sortOrder = "desc", CancellationToken cancellationToken = default);
    Task<ComputerDto?> GetByIdAsync(int id, CancellationToken cancellationToken = default);
    Task<PaginatedResult<ComputerDto>> SearchAsync(string query, int page, int pageSize, string sortBy = "createdAt", string sortOrder = "desc", CancellationToken cancellationToken = default);
    Task<ComputerDto> CreateAsync(ComputerCreateDto dto, CancellationToken cancellationToken = default);
    Task<ComputerDto?> UpdateAsync(int id, ComputerUpdateDto dto, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(int id, CancellationToken cancellationToken = default);
    Task<DashboardStatsDto> GetDashboardStatsAsync(CancellationToken cancellationToken = default);
}
