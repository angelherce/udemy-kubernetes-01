minikube addons enable ingress

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f ./k8s/deployment.yaml
kubectl apply -f ./k8s/service.yaml
kubectl apply -f ./k8s/ingress-rules.yaml

kubectl get pod
kubectl get svc
kubectl get ingress

kubectl delete -f ./k8s/ingress-rules.yaml
kubectl delete -f ./k8s/service.yaml
kubectl delete -f ./k8s/deployment.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml