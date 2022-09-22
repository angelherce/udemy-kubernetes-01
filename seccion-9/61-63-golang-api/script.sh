# docker run --rm -dit --net host -v $PWD/backend:/go --name golang bash
docker run --rm -d --net host -v $PWD/backend:/go --name golang golang go run main.go

docker rm -f golang

docker run --rm -it --net host -v $PWD/backend:/go --name golang golang go run main.go

docker build -t server -f ./backend/Dockerfile ./backend

# docker run -d -p 9090:9090 --name server server
docker run -p 9090:9090 --name server server