kubectl apply -f ./k8s/manifest-dns.yaml

kubectl get all

kubectl config current-context

kubectl config view

kubectl config set-context context-dev --namespace=dev --cluster=minikube --user=minikube

kubectl config use-context context-dev

kubectl get all

kubectl config use-context minikube

kubectl delete -f ./k8s/manifest-dns.yaml