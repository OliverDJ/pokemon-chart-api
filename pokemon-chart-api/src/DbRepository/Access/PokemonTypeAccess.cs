using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System.Collections.Generic;


namespace DbRepository
{
    public class PokemonTypeDbAccess
    {
        PokemonDbContext _c;

        public PokemonTypeDbAccess(PokemonDbContext c)
        {
            this._c = c;

        }

        public async Task<PokemonType> getPokemonType(int id)
        {
            var r = await
                    _c
                        .PokemonTypes
                        .SingleOrDefaultAsync(q => q.Id == id);
            return r;
        }

        public async Task<List<PokemonType>> getAllPokemonTypes()
        {
            var r = await
                    _c
                        .PokemonTypes
                        .ToListAsync();
            return r;
        }

    }
}
