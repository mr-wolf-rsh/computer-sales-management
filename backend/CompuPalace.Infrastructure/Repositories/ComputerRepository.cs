using CompuPalace.Application.DTOs;
using CompuPalace.Application.Interfaces;
using CompuPalace.Domain.Entities;
using CompuPalace.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace CompuPalace.Infrastructure.Repositories;

public class ComputerRepository : IComputerRepository
{
    private readonly AppDbContext _context;

    public ComputerRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<PaginatedResult<Computer>> GetPagedAsync(int page, int pageSize, string sortBy = "createdAt", string sortOrder = "desc", CancellationToken cancellationToken = default)
    {
        var baseQuery = _context.Computers
            .Include(c => c.Processor)
            .Include(c => c.Gpu)
            .Include(c => c.StorageDrives)
            .Include(c => c.UsbPorts);

        var query = ApplySorting(baseQuery, sortBy, sortOrder)
            .AsNoTracking();

        var totalCount = await query.CountAsync(cancellationToken);

        var items = await query
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync(cancellationToken);

        return new PaginatedResult<Computer>
        {
            Items = items,
            TotalCount = totalCount,
            Page = page,
            PageSize = pageSize
        };
    }

    public async Task<Computer?> GetByIdAsync(int id, CancellationToken cancellationToken = default)
    {
        return await _context.Computers
            .Include(c => c.Processor)
            .Include(c => c.Gpu)
            .Include(c => c.StorageDrives)
            .Include(c => c.UsbPorts)
            .FirstOrDefaultAsync(c => c.Id == id, cancellationToken);
    }

    public async Task<PaginatedResult<Computer>> SearchAsync(string query, int page, int pageSize, string sortBy = "createdAt", string sortOrder = "desc", CancellationToken cancellationToken = default)
    {
        var baseQuery = _context.Computers
            .Include(c => c.Processor)
            .Include(c => c.Gpu)
            .Include(c => c.StorageDrives)
            .Include(c => c.UsbPorts)
            .Where(c =>
                EF.Functions.Like(c.Name, $"%{query}%") ||
                EF.Functions.Like(c.Processor.Name, $"%{query}%") ||
                EF.Functions.Like(c.Processor.Brand, $"%{query}%") ||
                EF.Functions.Like(c.Gpu.Name, $"%{query}%") ||
                EF.Functions.Like(c.Gpu.Brand, $"%{query}%"));

        var searchQuery = ApplySorting(baseQuery, sortBy, sortOrder)
            .AsNoTracking();

        var totalCount = await searchQuery.CountAsync(cancellationToken);

        var items = await searchQuery
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync(cancellationToken);

        return new PaginatedResult<Computer>
        {
            Items = items,
            TotalCount = totalCount,
            Page = page,
            PageSize = pageSize
        };
    }

    private static IQueryable<Computer> ApplySorting(IQueryable<Computer> query, string sortBy, string sortOrder)
    {
        var isAscending = string.Equals(sortOrder, "asc", StringComparison.OrdinalIgnoreCase);

        IOrderedQueryable<Computer> ordered = sortBy?.ToLowerInvariant() switch
        {
            "name" => isAscending ? query.OrderBy(c => c.Name) : query.OrderByDescending(c => c.Name),
            "price" => isAscending ? query.OrderBy(c => c.Price) : query.OrderByDescending(c => c.Price),
            "ram" => isAscending ? query.OrderBy(c => c.RamAmountMB) : query.OrderByDescending(c => c.RamAmountMB),
            _ => isAscending ? query.OrderBy(c => c.CreatedAt) : query.OrderByDescending(c => c.CreatedAt),
        };

        return isAscending ? ordered.ThenBy(c => c.Id) : ordered.ThenByDescending(c => c.Id);
    }

    public async Task<Computer> CreateAsync(Computer computer, CancellationToken cancellationToken = default)
    {
        await _context.Computers.AddAsync(computer, cancellationToken);
        return computer;
    }

    public Task<Computer> UpdateAsync(Computer computer, CancellationToken cancellationToken = default)
    {
        _context.Computers.Update(computer);
        return Task.FromResult(computer);
    }

    public async Task DeleteAsync(int id, CancellationToken cancellationToken = default)
    {
        var computer = await _context.Computers.FindAsync(new object[] { id }, cancellationToken);
        if (computer is not null)
        {
            _context.Computers.Remove(computer);
        }
    }

    public async Task<DashboardStatsDto> GetDashboardStatsAsync(CancellationToken cancellationToken = default)
    {
        var computers = _context.Computers
            .Include(c => c.Gpu)
            .Include(c => c.StorageDrives)
            .AsNoTracking();

        var totalComputers = await computers.CountAsync(cancellationToken);

        if (totalComputers == 0)
        {
            return new DashboardStatsDto
            {
                TotalComputers = 0,
                AvgPrice = 0,
                AvgRam = 0,
                MinPrice = 0,
                MaxPrice = 0,
                StorageDistribution = new Dictionary<string, int>(),
                GpuBrandDistribution = new Dictionary<string, int>()
            };
        }

        var avgPrice = await computers.AverageAsync(c => c.Price, cancellationToken);
        var avgRam = await computers.AverageAsync(c => (double)c.RamAmountMB, cancellationToken);
        var minPrice = await computers.MinAsync(c => c.Price, cancellationToken);
        var maxPrice = await computers.MaxAsync(c => c.Price, cancellationToken);

        var storageDistribution = await _context.StorageDrives
            .GroupBy(sd => sd.Type)
            .Select(g => new { Type = g.Key.ToString(), Count = g.Count() })
            .ToDictionaryAsync(x => x.Type, x => x.Count, cancellationToken);

        var gpuBrandDistribution = await computers
            .GroupBy(c => c.Gpu.Brand)
            .Select(g => new { Brand = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.Brand, x => x.Count, cancellationToken);

        return new DashboardStatsDto
        {
            TotalComputers = totalComputers,
            AvgPrice = avgPrice,
            AvgRam = avgRam,
            MinPrice = minPrice,
            MaxPrice = maxPrice,
            StorageDistribution = storageDistribution,
            GpuBrandDistribution = gpuBrandDistribution
        };
    }
}
