using CompuPalace.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace CompuPalace.Infrastructure.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<Computer> Computers => Set<Computer>();
    public DbSet<Processor> Processors => Set<Processor>();
    public DbSet<Gpu> Gpus => Set<Gpu>();
    public DbSet<StorageDrive> StorageDrives => Set<StorageDrive>();
    public DbSet<UsbPort> UsbPorts => Set<UsbPort>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfiguration(new Configurations.ComputerConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.ProcessorConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.GpuConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.StorageDriveConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.UsbPortConfiguration());
    }
}
