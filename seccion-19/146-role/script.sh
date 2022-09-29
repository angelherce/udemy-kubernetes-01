kubectl api-resources | grep -i role

kubectl apply -f ./k8s/rbac/rol.yaml

kubectl get role

kubectl describe role pod-reader

kubectl delete -f ./k8s/rbac/rol.yaml