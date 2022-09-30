kubectl apply -f ./k8s/rbac/role.yaml -f ./k8s/rbac/role-binding.yaml

kubectl get rolebinding

kubectl describe rolebinding developer

kubectl config use-context angelhs

kubectl get pod
kubectl get deployment

kubectl config use-context minikube

kubectl delete -f ./k8s/rbac/role-binding.yaml -f ./k8s/rbac/role.yaml