
namespace Api

    module Configuration =
        open Microsoft.Extensions.Configuration
        open ConfigurationModels

        let getConfiguration() = 
            let builder = 
                ConfigurationBuilder()
                    //.AddJsonFile("local.settings.json", true, true )
                    .AddEnvironmentVariables()
            builder.Build()

        let iconfig = getConfiguration ()

        let getConfigModel () =
            let m = iconfig.Get<ApiSettings>()
            m

