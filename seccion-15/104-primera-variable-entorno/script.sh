kubectl apply -f ./k8s/pod.yaml

kubectl exec podtest -- sh -c env

kubectl delete -f ./k8s/pod.yaml