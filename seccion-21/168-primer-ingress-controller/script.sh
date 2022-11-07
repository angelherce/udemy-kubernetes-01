kubectl apply -f ./k8s/nginx-controller.yaml
minikube addons enable ingress

kubectl -n ingress-nginx get pod

kubectl delete -f ./k8s/nginx-controller.yaml
minikube addons disable ingress