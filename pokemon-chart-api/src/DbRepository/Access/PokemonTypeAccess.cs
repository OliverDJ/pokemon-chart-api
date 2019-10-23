using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
namespace DbRepository
{
    public class PokemonTypeAccess2
    {
        PokemonDbContext _c;

        public PokemonTypeAccess2(PokemonDbContext c)
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

    }
}
