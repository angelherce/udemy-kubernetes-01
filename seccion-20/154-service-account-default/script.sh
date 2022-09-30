kubectl get serviceaccount
kubectl get sa

kubectl describe serviceaccount default
kubectl describe sa default

kubectl create ns proof

kubectl get serviceaccount -n proof
kubectl get sa -n proof

kubectl delete ns proof

kubectl get serviceaccount -n kube-system
kubectl get sa -n kube-system

kubectl get serviceaccount default -o yaml
kubectl get sa default -o yaml

