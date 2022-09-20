kubectl apply -f ./k8s/service.yaml

kubectl get service -l app=frontend
kubectl get svc -l app=frontend

kubectl get service --field-selector metadata.name=service-test
kubectl get svc --field-selector metadata.name=service-test

kubectl describe service service-test
kubectl describe svc service-test

kubectl delete -f ./k8s/service.yaml