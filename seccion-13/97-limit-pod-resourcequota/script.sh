kubectl apply -f ./k8s/namespace.yaml -f ./k8s/resourcequota.yaml -f ./k8s/deployment.yaml

kubectl get resourcequota -n dev

kubectl get resourcequota resource-quota-test -n dev -o yaml

kubectl describe namespace dev
kubectl describe resourcequota resource-quota-test -n dev

kubectl get deployment -n dev
kubectl describe deployment deployment-test -n dev

kubectl get pods -n dev

# Añadimos 1 Pod más en el Deployment

kubectl apply -f ./k8s/namespace.yaml -f ./k8s/resourcequota.yaml -f ./k8s/deployment.yaml

kubectl get pods -n dev

kubectl describe deployment deployment-test -n dev
kubectl get deployment deployment-test -n dev -o yaml

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/resourcequota.yaml -f ./k8s/namespace.yaml