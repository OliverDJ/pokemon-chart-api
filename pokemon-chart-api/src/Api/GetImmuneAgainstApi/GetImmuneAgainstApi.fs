


namespace Api


    module GetImmuneAgainstApi =
        open Microsoft.Extensions.Logging
        open System.Net.Http
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbHelper
        open DbService.RelationshipAccess
        open RelationshipMappers
        open Newtonsoft.Json
        open Configuration
        
        let conf = getConfigModel()
        
        let run(req: HttpRequestMessage, id : int,  log: ILogger) =
            task {
                let con = conf.ConnectionStrings.PokemonDatabase
                let dbctx = con |> getDbContext
                let! q = (dbctx(), id) ||> getImmuneAgainst
                let r = q |> List.map mapDbServiceToApi |> List.map getA
                let ret = r |> JsonConvert.SerializeObject
                return ret
            }