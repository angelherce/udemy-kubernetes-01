kubectl apply -f ./k8s/service.yaml

kubectl get service

kubectl describe service service-test

kubectl run --image=nginx:alpine --rm -it podtest -- sh

apk add -U curl
curl 10.101.224.46:8080
curl service-test:8080

# EXIT

kubectl delete -f ./k8s/service.yaml