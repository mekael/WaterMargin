using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using WaterMargin.LoginServer.Data.Models;

namespace WaterMargin.LoginServer.Data;


public class AuthDbContext : IdentityDbContext<ApplicationUser, IdentityRole<Guid>, Guid>
{
    public AuthDbContext(DbContextOptions<AuthDbContext> options)
        : base(options)
    {
    }

    public override int SaveChanges()
    {
        var addedOrUpdatedEntries = ChangeTracker.Entries<EntityBase>().Where(w => w.State == EntityState.Added || w.State == EntityState.Modified);
        var addedEntries = ChangeTracker.Entries<EntityBase>().Where(w => w.State == EntityState.Added);
        foreach (var entry in addedOrUpdatedEntries)
        {
            entry.Entity.LastModificationTimestamp = DateTimeOffset.Now;
        }

        foreach (var entry in addedEntries)
        {
            entry.Entity.CreationTimestamp = DateTimeOffset.Now;
        }
        return base.SaveChanges();
    }

    public DbSet<LoginTrackingItem> LoginTrackingItems { get; set; }
    public DbSet<PlayerBan> PlayerBans { get; set; }
}
