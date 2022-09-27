kubectl apply -f ./k8s/namespace.yaml -f ./k8s/resourcequota.yaml

kubectl get resourcequota -n dev

kubectl get resourcequota resource-quota-test -n dev -o yaml

kubectl describe namespace dev
kubectl describe resourcequota resource-quota-test -n dev

kubectl delete -f ./k8s/resourcequota.yaml -f ./k8s/namespace.yaml