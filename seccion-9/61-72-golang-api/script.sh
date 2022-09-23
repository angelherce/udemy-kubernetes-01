# BACKEND
docker build -t golang-app-server:v1 -f ./backend/Dockerfile ./backend

minikube image load golang-app-server:v1

kubectl apply -f ./backend/k8s.yaml

# FRONTEND
docker build -t golang-app-client:v1 -f ./frontend/Dockerfile ./frontend

minikube image load golang-app-client:v1

kubectl apply -f ./frontend/k8s.yaml

# ALL PODS
kubectl get pods -l app=golang-app