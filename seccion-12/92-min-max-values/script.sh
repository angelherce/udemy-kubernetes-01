kubectl apply -f ./k8s/namespace.yaml -f ./k8s/limit.yaml -f ./k8s/pod.yaml

kubectl get limitrange -n dev

kubectl describe limitrange limit-range -n dev

kubectl describe namespace dev

kubectl get pod -n dev

kubectl delete -f ./k8s/pod.yaml -f ./k8s/limit.yaml -f ./k8s/namespace.yaml