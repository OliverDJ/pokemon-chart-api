


namespace DbService


    module DbContext = 
        open Microsoft.EntityFrameworkCore
        open DbRepository


        let configureSqlServerContext  (s:string) =
            fun () -> 
                let optionsBuilder =
                    new DbContextOptionsBuilder<PokemonDbContext>()
                optionsBuilder
                    .UseLazyLoadingProxies()
                    .UseSqlServer(s) 
                |> ignore 

                new PokemonDbContext(optionsBuilder.Options)