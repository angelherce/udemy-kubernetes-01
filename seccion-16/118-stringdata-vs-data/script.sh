kubectl apply -f ./k8s/secret-data.yaml && kubectl apply -f ./k8s/secret-stringdata.yaml

kubectl get secrets

kubectl describe secret my-secret-data
kubectl describe secret my-secret-stringdata

kubectl get secret my-secret-data -o yaml
kubectl get secret my-secret-stringdata -o yaml

kubectl delete -f ./k8s/secret-data.yaml && kubectl delete -f ./k8s/secret-stringdata.yaml