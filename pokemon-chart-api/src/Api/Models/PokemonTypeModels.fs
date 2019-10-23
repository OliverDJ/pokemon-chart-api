
namespace Api
    
    module PokemonTypeModels = 
        
        [<CLIMutable>]
        type PokemonType =
            {
                Id : int
                Name : string
                Color : string
            }

