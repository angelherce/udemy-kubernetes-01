kubectl apply -f ./k8s/nginx-controller.yaml
kubectl apply -f ./k8s/service.yaml

kubectl -n ingress-nginx get pod
kubectl -n ingress-nginx get svc

minikube service -n ingress-nginx ingress-nginx

kubectl delete -f ./k8s/service.yaml
kubectl delete -f ./k8s/nginx-controller.yaml