


namespace Api


    module GetStrongAgainstApi =
        open Microsoft.Extensions.Logging
        open System.Net.Http
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbHelper
        open DbService.RelationshipAccess
        open RelationshipMappers
        open Newtonsoft.Json

        let run(req: HttpRequestMessage, id : int,  log: ILogger) =
            task {
                let con = "Server=localhost, 8433; Database=PokemonDB; User ID=SA; Password=pass123?"
                let dbctx = con |> getDbContext
                let! q = (dbctx(), id) ||> getStrongAgainst
                let r = q |> List.map mapDbServiceToApi
                let ret = r |> JsonConvert.SerializeObject
                return ret
            }