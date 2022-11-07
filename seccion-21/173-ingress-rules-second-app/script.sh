kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml
minikube addons enable ingress

kubectl apply -f ./k8s/app-v1.yaml
kubectl apply -f ./k8s/app-v2.yaml
kubectl apply -f ./k8s/ingress.yaml

kubectl get ingress
sudo vi /etc/hosts
# Añadimos 192.168.49.2 app.v1.org ([ADDRESS DE INGRESS] [HOST DE INGRESS])
# Añadimos 192.168.49.2 app.v2.org ([ADDRESS DE INGRESS] [HOST DE INGRESS])
:wq

curl app.v1.org
curl 192.168.49.2/app/v1
curl app.v2.org
curl 192.168.49.2/app/v2

kubectl delete -f ./k8s/ingress.yaml
kubectl delete -f ./k8s/app-v2.yaml
kubectl delete -f ./k8s/app-v1.yaml

kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml
minikube addons disable ingress