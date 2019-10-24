
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace DbRepository
{
    public class RelationshipDbAccess
    {
        PokemonDbContext _c;
        public RelationshipDbAccess(PokemonDbContext c)
        {
            this._c = c;
        }

        public async Task<List<Relationship>> getAllRelationships(int id)
        {
            var r = await
                    _c
                        .Relationships
                            .Include(q => q.TypeANavigation)
                            .Include(q => q.TypeBNavigation)
                            .Where(q => q.TypeANavigation.Id == id)
                            .ToListAsync();
            return r;
        }

        public async Task<List<Relationship>> getStrongAgainst(int id)
        {
            var r = await
                    _c
                        .Relationships
                            .Include(q => q.TypeANavigation)
                            .Include(q => q.TypeBNavigation)
                            .Where(q => q.TypeANavigation.Id == id && q.Multiplier == 2.0)
                            .ToListAsync();
            return r;
        }

        public async Task<List<Relationship>> getNotEffectiveAgainst(int id)
        {
            var r = await
                    _c
                        .Relationships
                            .Include(q => q.TypeANavigation)
                            .Include(q => q.TypeBNavigation)
                            .Where(q => q.TypeANavigation.Id == id && q.Multiplier == 0.5)
                            .ToListAsync();
            return r;
        }

        public async Task<List<Relationship>> getWeakAgainst(int id)
        {
            var r = await
                    _c
                        .Relationships
                            .Include(q => q.TypeANavigation)
                            .Include(q => q.TypeBNavigation)
                            .Where(q => q.TypeBNavigation.Id == id && q.Multiplier == 2.0)
                            .ToListAsync();
            return r;
        }


    }
}
