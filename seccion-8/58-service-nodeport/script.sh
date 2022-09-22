kubectl apply -f ./k8s/service.yaml

kubectl get pods -l app=backend

kubectl get service -l app=backend

kubectl delete -f ./k8s/service.yaml