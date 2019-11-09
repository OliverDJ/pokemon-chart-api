
namespace Api

    module RelationshipModels = 
        
        open PokemonTypeModels
        
        [<CLIMutable>]
        type Relationship =
            {
                PokemonTypeA : PokemonType
                PokemonTypeB : PokemonType
                Multiplier : float
            }
    

