kubectl api-resources

kubectl apply -f ./k8s/rs.yaml

kubectl get pods -l app=pod-label

# kubectl get replicaset
kubectl get rs

# kubectl delete pod <POD_NAME>