using CompuPalace.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CompuPalace.Infrastructure.Data.Configurations;

public class GpuConfiguration : IEntityTypeConfiguration<Gpu>
{
    public void Configure(EntityTypeBuilder<Gpu> builder)
    {
        builder.ToTable("Gpus");

        builder.HasKey(g => g.Id);

        builder.Property(g => g.Name)
            .IsRequired()
            .HasMaxLength(200);

        builder.Property(g => g.Brand)
            .IsRequired()
            .HasMaxLength(50);

        builder.Property(g => g.CreatedAt)
            .IsRequired();
    }
}
