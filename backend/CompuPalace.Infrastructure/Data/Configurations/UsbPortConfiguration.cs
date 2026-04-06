using CompuPalace.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CompuPalace.Infrastructure.Data.Configurations;

public class UsbPortConfiguration : IEntityTypeConfiguration<UsbPort>
{
    public void Configure(EntityTypeBuilder<UsbPort> builder)
    {
        builder.ToTable("UsbPorts");

        builder.HasKey(up => up.Id);

        builder.Property(up => up.Count)
            .IsRequired();

        builder.Property(up => up.UsbType)
            .IsRequired()
            .HasMaxLength(10);

        builder.Property(up => up.CreatedAt)
            .IsRequired();
    }
}
