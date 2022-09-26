kubectl apply -f ./k8s/manifest.yaml

kubectl get pods

kubectl describe pod cpu-test

kubectl get pod cpu-test -o yaml

kubectl get nodes

kubectl describe node minikube

kubectl delete -f ./k8s/manifest.yaml