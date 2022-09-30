kubectl apply -f ./k8s/rbac/cluster-role-binding.yaml

kubectl describe clusterrolebinding cluster-admin-bind

kubectl delete -f ./k8s/rbac/cluster-role-binding.yaml