# FROM microsoft/azure-functions-dotnet-core2.2:2.2

# ENV AzureWebJobsScriptRoot=/home/site/wwwroot

# COPY ./bin/Release/netstandard2.0 /home/site/wwwroot
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

# Copy fsproj and restore as distinct layers
COPY *.sln ./
COPY ./src/Api/*.fsproj ./src/Api/
COPY ./src/DbService/*.fsproj ./src/DbService/
COPY ./src/DbRepository/*.csproj ./src/DbRepository/
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out


# FROM mcr.microsoft.com/azure-functions/dotnet
# WORKDIR /app
FROM mcr.microsoft.com/azure-functions/dotnet:2.0
ENV AzureWebJobsScriptRoot=/app/out/
ENV AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY --from=build-env /app/src/Api/out /app/out/
# COPY --from=build-env ["/app", "/app"]

# CMD tail -f /dev/null

