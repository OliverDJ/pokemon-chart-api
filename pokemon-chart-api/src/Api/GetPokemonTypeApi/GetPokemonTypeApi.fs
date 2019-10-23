
namespace Api


    module GetPokemonTypeApi =
        
        open Microsoft.Azure.WebJobs
        open Microsoft.Extensions.Logging
        open System.Net.Http
        open System
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbHelper
        open DbService.PokemonTypeAccess
        open PokemonTypeMappers
        open Newtonsoft.Json

        let run(req: HttpRequestMessage, log: ILogger) =
            task {
                let con = "Server=localhost, 8433; Database=PokemonDB; User ID=SA; Password=pass123?"
                let dbctx = con |> getDbContext
                let! q = (dbctx(), 10) ||> getPokemonTypeById
                let r = q |> mapDbServiceToApi
                let resp = r |> JsonConvert.SerializeObject
                
                return resp
            }
            