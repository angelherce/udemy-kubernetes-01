kubectl apply -f ./k8s/limit.yaml

kubectl get limitrange -n dev

kubectl describe limitrange limit-range -n dev

kubectl get limitrange limit-range -n dev -o yaml

kubectl delete -f ./k8s/limit.yaml