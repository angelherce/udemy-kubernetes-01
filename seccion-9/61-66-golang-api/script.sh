# docker run --rm -dit --net host -v $PWD/backend:/go --name golang bash
docker run --rm -d --net host -v $PWD/backend:/go --name golang golang go run main.go

docker rm -f golang

docker run --rm -it --net host -v $PWD/backend:/go --name golang golang go run main.go

docker build -t server -f ./backend/Dockerfile ./backend

# docker run -d -p 9090:9090 --name server server
docker run -p 9090:9090 --name server server

docker build -t golang-app-server -f ./backend/Dockerfile ./backend

minikube image load golang-app-server:latest

kubectl apply -f ./backend/k8s.yaml

kubectl get pods -l app=golang-app

kubectl get deployments golang-app -o yaml | grep -i imagePullPolicy -C 5

kubectl apply -f ./backend/k8s.yaml

kubectl get deployments.apps golang-app -o yaml | grep -i imagePullPolicy -C 5

kubectl get pods -l app=golang-app

kubectl get deployment golang-app

kubectl get service golang-app

minikube service golang-app

kubectl run --rm -it podtest --image=nginx:alpine -- sh

apk add -U curl

curl 10.110.139.223:80
curl golang-app:80