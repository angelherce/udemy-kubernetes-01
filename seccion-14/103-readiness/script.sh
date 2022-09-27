kubectl apply -f ./k8s/pod.yaml

kubectl get pod liveness-exec

kubectl describe pod liveness-exec

kubectl get pod liveness-exec -o yaml | grep -i readinessProbe: -A 12
kubectl get pod liveness-exec -o yaml | grep -i livenessProbe: -A 12

kubectl delete -f ./k8s/pod.yaml