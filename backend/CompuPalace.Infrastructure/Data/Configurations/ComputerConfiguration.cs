using CompuPalace.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CompuPalace.Infrastructure.Data.Configurations;

public class ComputerConfiguration : IEntityTypeConfiguration<Computer>
{
    public void Configure(EntityTypeBuilder<Computer> builder)
    {
        builder.ToTable("Computers");

        builder.HasKey(c => c.Id);

        builder.Property(c => c.Name)
            .IsRequired()
            .HasMaxLength(200);

        builder.Property(c => c.RamAmountMB)
            .IsRequired();

        builder.Property(c => c.Price)
            .IsRequired()
            .HasColumnType("decimal(10,2)");

        builder.Property(c => c.ImageUrl)
            .HasMaxLength(500);

        builder.Property(c => c.Weight)
            .IsRequired()
            .HasColumnType("decimal(6,2)");

        builder.Property(c => c.WeightUnit)
            .IsRequired()
            .HasConversion(
                v => v.ToString().ToLower(),
                v => Enum.Parse<CompuPalace.Domain.Enums.WeightUnit>(v, true))
            .HasMaxLength(5);

        builder.Property(c => c.PsuWattage)
            .IsRequired();

        builder.Property(c => c.Status)
            .IsRequired()
            .HasMaxLength(20)
            .HasDefaultValue("New");

        builder.Property(c => c.CreatedAt)
            .IsRequired();

        builder.HasOne(c => c.Processor)
            .WithMany(p => p.Computers)
            .HasForeignKey(c => c.ProcessorId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(c => c.Gpu)
            .WithMany(g => g.Computers)
            .HasForeignKey(c => c.GpuId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasMany(c => c.StorageDrives)
            .WithOne(sd => sd.Computer)
            .HasForeignKey(sd => sd.ComputerId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasMany(c => c.UsbPorts)
            .WithOne(up => up.Computer)
            .HasForeignKey(up => up.ComputerId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
