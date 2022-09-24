kubectl get namespaces

kubectl  run --rm -it podtest --image=nginx:alpine -- sh

kubectl get pods --namespace default
kubectl get pods --n default

kubectl get all -n kube-public