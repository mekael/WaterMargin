using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using WaterMargin.GameServer.Data.Models;

namespace WaterMargin.GameServer.Data;


public class GameServerDbContext : DbContext 
{
    public GameServerDbContext(DbContextOptions<GameServerDbContext> options)
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

  
}
