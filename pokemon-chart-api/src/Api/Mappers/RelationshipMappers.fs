namespace Api

    module RelationshipMappers =
        

        open RelationshipModels
        open PokemonTypeMappers
        open PokemonTypeModels

        let mapDbServiceToApi (m: DbService.RelationshipModels.Relationship) : Relationship =
            {
                PokemonTypeA = m.PokemonTypeA |> mapDbServiceToApi
                PokemonTypeB = m.PokemonTypeB |> mapDbServiceToApi
                Multiplier = m.Multiplier
            }

        let getA (m: Relationship ) =
            {
                Id = m.PokemonTypeA.Id
                Name = m.PokemonTypeA.Name 
                Color = m.PokemonTypeA.Color
            }

        let getB (m: Relationship ) =
            {
                Id = m.PokemonTypeB.Id
                Name = m.PokemonTypeB.Name 
                Color = m.PokemonTypeB.Color
            }