kubectl apply -f ./k8s/rbac/cluster-role.yaml -f ./k8s/rbac/cluster-role-binding.yaml

kubectl get clusterrole | grep -i cluster-pod-reader
kubectl get clusterrolebinding | grep -i cluster-pod-reader

kubectl describe clusterrole cluster-pod-reader
kubectl describe clusterrolebinding cluster-pod-reader-bind

kubectl config use-context angelhs

kubectl get pod

kubectl config use-context minikube

kubectl delete -f ./k8s/rbac/cluster-role-binding.yaml -f ./k8s/rbac/cluster-role.yaml