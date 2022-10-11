kubectl apply -f ./k8s/rbac/service-account.yaml

kubectl get sa
kubectl describe sa my-service-account
kubectl get sa my-service-account -o yaml

kubectl delete -f ./k8s/rbac/service-account.yaml

