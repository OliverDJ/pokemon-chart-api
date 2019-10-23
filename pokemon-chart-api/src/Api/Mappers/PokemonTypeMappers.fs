namespace Api


    module PokemonTypeMappers =
        open PokemonTypeModels

        let mapDbServiceToApi (m: DbService.PokemonTypeModels.PokemonType) : PokemonType =
            {
                Id = m.Id
                Name = m.Name
                Color = m.Color
            }

