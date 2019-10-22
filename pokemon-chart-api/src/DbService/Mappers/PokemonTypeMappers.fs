
namespace DbService

    module PokemonTypeMappers =
        open PokemonTypeModels

        let mapDbRepoToDbService (m: DbRepository.PokemonType): PokemonType =
            {
                Id = m.Id
                Name = m.Name
                Color = m.Color
            }
            

