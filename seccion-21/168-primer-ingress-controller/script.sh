minikube addons enable ingress

kubectl apply -f ./k8s/nginx-controller.yaml

kubectl -n ingress-nginx get pod

kubectl delete -f ./k8s/nginx-controller.yaml