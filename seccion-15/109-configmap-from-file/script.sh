docker run --rm nginx:alpine cat /etc/nginx/conf.d/default.conf > ./k8s/configmap/nginx.conf

kubectl create configmap nginx-config --from-file=./k8s/configmap/nginx/nginx.conf

kubectl get configmap
kubectl get cm

kubectl describe configmap nginx-config
kubectl describe cm nginx-config

kubectl delete configmap nginx-config
kubectl delete cm nginx-config

kubectl create cm nginx-config --from-file=./k8s/configmap/nginxv

kubectl get configmap
kubectl get cm

kubectl delete cm nginx-config