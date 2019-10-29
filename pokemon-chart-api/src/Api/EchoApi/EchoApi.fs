


namespace Api


    module EchoApi =
        open Microsoft.Extensions.Logging
        open System.Net.Http
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbService.RelationshipAccess
        open Newtonsoft.Json
        
        let getContent (req: HttpRequestMessage) = req.Content.ReadAsStringAsync()

        let run(req: HttpRequestMessage, str : string, log: ILogger) =
            task {
                //let! r = req |> getContent
                log.LogInformation(sprintf "Recieved: %s" str)
                return str
            }