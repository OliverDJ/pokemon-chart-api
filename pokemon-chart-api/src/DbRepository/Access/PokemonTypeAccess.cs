using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
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

    }
}
