using CompuPalace.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CompuPalace.Infrastructure.Data.Configurations;

public class ProcessorConfiguration : IEntityTypeConfiguration<Processor>
{
    public void Configure(EntityTypeBuilder<Processor> builder)
    {
        builder.ToTable("Processors");

        builder.HasKey(p => p.Id);

        builder.Property(p => p.Name)
            .IsRequired()
            .HasMaxLength(200);

        builder.Property(p => p.Brand)
            .IsRequired()
            .HasMaxLength(50);

        builder.Property(p => p.CreatedAt)
            .IsRequired();
    }
}
