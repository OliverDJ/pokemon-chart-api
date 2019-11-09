namespace Api

        
    module DbHelper =

        let getDbContext s = 
            let dbctx = 
                s |> DbService.DbContext.configureSqlServerContext
            dbctx

