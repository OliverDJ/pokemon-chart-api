namespace Api

    module RelationshipMappers =
        

        open RelationshipModels
        open PokemonTypeMappers

        let mapDbServiceToApi (m: DbService.RelationshipModels.Relationship) : Relationship =
            {
                PokemonTypeA = m.PokemonTypeA |> mapDbServiceToApi
                PokemonTypeB = m.PokemonTypeB |> mapDbServiceToApi
                Multiplier = m.Multiplier
            }