using CompuPalace.Application.Mappings;
using CompuPalace.Application.Services;
using FluentValidation;
using Microsoft.Extensions.DependencyInjection;

namespace CompuPalace.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection services)
    {
        services.AddSingleton<IComputerMapper, ComputerMapper>();
        services.AddValidatorsFromAssembly(typeof(DependencyInjection).Assembly);
        services.AddScoped<IComputerService, ComputerService>();

        return services;
    }
}
