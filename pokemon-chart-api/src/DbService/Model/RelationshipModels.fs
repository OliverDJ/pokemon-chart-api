namespace DbService

    module RelationshipModels =
        
        open PokemonTypeModels

        type Relationship =
            {
                PokemonTypeA : PokemonType
                PokemonTypeB : PokemonType
                Multiplier : float
            }

