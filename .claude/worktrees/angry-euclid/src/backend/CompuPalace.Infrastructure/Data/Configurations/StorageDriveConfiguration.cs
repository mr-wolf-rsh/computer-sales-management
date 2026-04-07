using CompuPalace.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CompuPalace.Infrastructure.Data.Configurations;

public class StorageDriveConfiguration : IEntityTypeConfiguration<StorageDrive>
{
    public void Configure(EntityTypeBuilder<StorageDrive> builder)
    {
        builder.ToTable("StorageDrives");

        builder.HasKey(sd => sd.Id);

        builder.Property(sd => sd.CapacityGB)
            .IsRequired();

        builder.Property(sd => sd.Type)
            .IsRequired()
            .HasConversion<string>()
            .HasMaxLength(10);

        builder.Property(sd => sd.CreatedAt)
            .IsRequired();
    }
}
