
namespace Api


    module GetAllPokemonTypesApi =
        
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

        let run(req: HttpRequestMessage, log: ILogger) =
            task {
                let con = conf.ConnectionStrings.PokemonDatabase
                let dbctx = con |> getDbContext
                let! q = dbctx() |> getAllPokemonTypes
                let r = q |> Seq.map mapDbServiceToApi
                let resp = r |> JsonConvert.SerializeObject
                return resp
            }
            