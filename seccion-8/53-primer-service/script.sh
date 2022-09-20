kubectl apply -f ./k8s/service.yaml

kubectl get deployment

kubectl get service

kubectl port-forward service/service-test 8080:8080

curl http://localhost:8080

kubectl delete -f ./k8s/service.yaml