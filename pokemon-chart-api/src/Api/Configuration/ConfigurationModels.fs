namespace Api

    module ConfigurationModels =
        
        [<CLIMutable>]
        type ConnectionStrings = 
            {   
                PokemonDatabase: string
            }

        [<CLIMutable>]
        type ApiSettings = 
            {
                ConnectionStrings: ConnectionStrings
            }

