kubectl api-versions
kubectl api-resources | grep Pod

kubectl delete pod podtest

kubectl apply -f ./k8s/manifest/pods.yaml

kubectl get pods

kubectl delete -f ./k8s/manifest/pods.yaml

kubectl get pods