
namespace DbService

    module RelationshipMappers =
        
        open RelationshipModels
        open PokemonTypeMappers

        let mapDbRepoToDbService (m : DbRepository.Relationship) : Relationship =
            {
                PokemonTypeA = m.TypeANavigation |> mapDbRepoToDbService
                PokemonTypeB = m.TypeBNavigation |> mapDbRepoToDbService
                Multiplier = m.Multiplier
            }

