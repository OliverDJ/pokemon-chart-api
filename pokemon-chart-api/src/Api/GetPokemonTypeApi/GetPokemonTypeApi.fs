
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
        open Configuration

        let conf = getConfigModel()

        let run(req: HttpRequestMessage, id : int,  log: ILogger) =
            task {
                let con = conf.ConnectionStrings.PokemonDatabase
                let dbctx = con |> getDbContext
                let! q = (dbctx(), id) ||> getPokemonTypeById
                let r = q |> mapDbServiceToApi
                let resp = r |> JsonConvert.SerializeObject
                
                return resp
            }
            