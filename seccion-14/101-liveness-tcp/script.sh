kubectl apply -f ./k8s/pod.yaml

kubectl get pod liveness-exec

kubectl describe pod liveness-exec

kubectl delete -f ./k8s/pod.yaml