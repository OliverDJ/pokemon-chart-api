docker build . -t pokemon-api

docker run --name pokemon-api-container -p 8080:80 pokemon-api