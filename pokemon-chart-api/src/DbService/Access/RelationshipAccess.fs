



namespace DbService

    module RelationshipAccess =
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbRepository
        open RelationshipMappers
        open System.Threading.Tasks

        let private _getDba ctx = RelationshipDbAccess(ctx)

        let private _get f (id: int) =
            task{
                let! qr = id |> f
                let r = qr  |> Seq.map mapDbRepoToDbService |> Seq.toList
                return r
            }
        

        let private _getAll (dba : RelationshipDbAccess) = dba.getAllRelationships
        let private _getStrongAgainst (dba : RelationshipDbAccess) = dba.getStrongAgainst
        let private _getNotEffectiveAgainst (dba : RelationshipDbAccess) = dba.getNotEffectiveAgainst
        let private _getWeakAgainst (dba : RelationshipDbAccess) = dba.getWeakAgainst
        let private _getResistantAgainst (dba : RelationshipDbAccess) = dba.getResistantAgainst
        let private _getImmuneAgainst (dba : RelationshipDbAccess) = dba.getImmuneAgainst
        let private _getDoesNotEffect (dba : RelationshipDbAccess) = dba.getDoesNotEffect

        //let getAllRelationships  = _getDba >> _getAll >> _get 
        let getAllRelationships ctx = ctx |> _getDba |> _getAll |> _get 
        let getStrongAgainst ctx = ctx |> _getDba |> _getStrongAgainst |> _get
        let getNotEffectiveAgainst ctx = ctx |> _getDba |> _getNotEffectiveAgainst |> _get
        let getWeakAgainst ctx = ctx |> _getDba |> _getWeakAgainst |> _get
        let getResistantAgainst ctx = ctx |> _getDba |> _getResistantAgainst |> _get
        let getImmuneAgainst ctx = ctx |> _getDba |> _getImmuneAgainst |> _get
        let getDoesNotEffect ctx = ctx |> _getDba |> _getDoesNotEffect |> _get