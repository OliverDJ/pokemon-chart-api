using System;
using Microsoft.EntityFrameworkCore;

namespace DbRepository
{
    public partial class PokemonDbContext : DbContext
    {
        public PokemonDbContext()
        {
        }

        public PokemonDbContext(DbContextOptions<PokemonDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<PokemonType> PokemonTypes { get; set; }
        public virtual DbSet<Relationship> Relationships { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<PokemonType>(entity =>
            {
                entity.Property(e => e.Color)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Relationship>(entity =>
            {
                entity.HasKey(e => new { e.TypeA, e.TypeB });

                entity.HasOne(d => d.TypeANavigation)
                    .WithMany(p => p.RelationshipTypeANavigations)
                    .HasForeignKey(d => d.TypeA)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Relationships_PokemonTypes");

                entity.HasOne(d => d.TypeBNavigation)
                    .WithMany(p => p.RelationshipTypeBNavigations)
                    .HasForeignKey(d => d.TypeB)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Relationships_PokemonTypes1");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}