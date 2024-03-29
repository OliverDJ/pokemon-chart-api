﻿
namespace Api

    module GetRelationsApi =
        
        open Microsoft.Extensions.Logging
        open System.Net.Http
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbHelper
        open DbService.RelationshipAccess
        open RelationshipMappers
        open Newtonsoft.Json
        open Configuration

        open PokemonTypeModels
        open System.Threading.Tasks
        open RelationshipMappers
        open Newtonsoft.Json
        [<CLIMutable>]
        type Relations =
            {
                StrongAgainst : PokemonType array
                NotEffective : PokemonType array
                WeakAgainst : PokemonType array
                ResistantAgainst : PokemonType array
            }

        let conf = getConfigModel()

        let serialize = JsonConvert.SerializeObject 

        let getFunction dbctx mapper getFunc picker id : Task<PokemonType array>=
            task{
                let! q = (dbctx(), id) ||> getFunc
                let r = q |> List.map mapper |> List.map picker |> List.toArray
                return r
            }

        let run(req: HttpRequestMessage, id : int,  log: ILogger) =
            task{
                let con = conf.ConnectionStrings.PokemonDatabase
                let dbctx = con |> getDbContext
                let getHelper = getFunction dbctx mapDbServiceToApi

                let! strong = (getResistantAgainst, getB, id) |||> getHelper
                let! notEffective = (getResistantAgainst, getB, id) |||> getHelper
                let! weak = (getResistantAgainst, getA, id) |||> getHelper
                let! resistant = (getResistantAgainst, getA, id) |||> getHelper

                let relations =
                    {
                        StrongAgainst = strong
                        NotEffective = notEffective
                        WeakAgainst = weak
                        ResistantAgainst = resistant
                    }
                
                let ret = relations |> serialize
                return ret
            }
            

