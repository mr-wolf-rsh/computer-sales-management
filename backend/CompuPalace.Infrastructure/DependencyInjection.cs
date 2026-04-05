using CompuPalace.Application.Interfaces;
using CompuPalace.Infrastructure.Data;
using CompuPalace.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CompuPalace.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<AppDbContext>(options =>
            options.UseSqlServer(
                configuration.GetConnectionString("DefaultConnection"),
                b => b.MigrationsAssembly(typeof(AppDbContext).Assembly.FullName)));

        services.AddScoped<IUnitOfWork, UnitOfWork>();
        services.AddScoped<IComputerRepository, ComputerRepository>();
        services.AddScoped<IProcessorRepository, ProcessorRepository>();
        services.AddScoped<IGpuRepository, GpuRepository>();

        return services;
    }
}
