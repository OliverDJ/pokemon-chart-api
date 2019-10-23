



namespace DbService

    module RelationshipAccess =
        open DbContext
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbRepository
        open RelationshipMappers

        let private _getRelationshipById (ctx: PokemonDbContext) id =
            task{
                let p = RelationshipDbAccess(ctx)
                let! qr = id |> p.getRelationshipById
                let r = qr  |> Seq.map mapDbRepoToDbService |> Seq.toList
                return r
            }
           
        let getRelationshipById = _getRelationshipById

