kubectl apply -f ./k8s/rbac/cluster-role.yaml -f ./k8s/rbac/cluster-role-binding.yaml

kubectl describe clusterrolebinding cluster-pod-reader-bind

kubectl delete -f ./k8s/rbac/cluster-role-binding.yaml -f ./k8s/rbac/cluster-role.yaml