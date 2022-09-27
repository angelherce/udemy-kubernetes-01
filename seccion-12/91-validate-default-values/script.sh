kubectl apply -f ./k8s/namespace.yaml -f ./k8s/limit.yaml -f ./k8s/pod.yaml

kubectl get pod -n dev

kubectl get limitrange -n dev

kubectl describe limitrange limit-range -n dev

kubectl get pod podtest -n dev -o yaml | grep -i limits: -A 2
kubectl get pod podtest -n dev -o yaml | grep -i requests: -A 2

kubectl delete -f ./k8s/pod.yaml -f ./k8s/limit.yaml -f ./k8s/namespace.yaml
