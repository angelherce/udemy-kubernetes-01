kubectl apply -f ./k8s/service.yaml

kubectl get svc -l app=frontend

kubectl describe svc service-test

kubectl get endpoints

kubectl get endpoints service-test

kubectl get pods -l app=frontend -o wide

kubectl delete pod deployment-test-765db4b47b-bt95n

kubectl run --image=nginx:alpine podtest

kubectl label pod podtest app=frontend

kubectl get endpoints -o wide

kubectl describe endpoints service-test

kubectl get pods -l app=frontend -o wide

kubectl delete -f ./k8s/service.yaml