kubectl apply -f ./k8s/deployment.yaml
kubectl apply -f ./k8s/service.yaml

kubectl get pod
kubectl get svc

kubectl exec -it ingress-deploy-5cdc6cd886-6jc47 -- sh
apk add curl
curl ingress-svc:8080
exit

kubectl delete -f ./k8s/service.yaml
kubectl delete -f ./k8s/deployment.yaml