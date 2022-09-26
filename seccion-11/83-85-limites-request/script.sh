kubectl apply -f ./k8s/manifest.yaml

kubectl get pods

kubectl describe pod memory-test-1000gi

kubectl get pod memory-test-1000gi -o yaml

kubectl delete -f ./k8s/manifest.yaml