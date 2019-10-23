
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

        public async Task<List<Relationship>> getRelationshipById(int id)
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
    }
}
