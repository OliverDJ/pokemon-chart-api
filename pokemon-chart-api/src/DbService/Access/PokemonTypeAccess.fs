namespace DbService

    module PokemonTypeAccess =
        open DbContext
        open FSharp.Control.Tasks.V2.ContextInsensitive
        open DbRepository
        open PokemonTypeMappers

        let private _getPokemonTypeById (ctx: PokemonDbContext) id =
            task{
                let p = PokemonTypeDbAccess(ctx)
                let! qr = id |> p.getPokemonType
                let r = qr |> mapDbRepoToDbService
                return r
            }
           
        let private _getAllPokemonTypes(ctx: PokemonDbContext)=
            task{
                let p = PokemonTypeDbAccess(ctx)
                let! qr = p.getAllPokemonTypes()
                let r = qr |> Seq.map mapDbRepoToDbService
                return r
            }
        let getPokemonTypeById = _getPokemonTypeById
        let getAllPokemonTypes = _getAllPokemonTypes

