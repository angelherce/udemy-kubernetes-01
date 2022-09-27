kubectl apply -f ./k8s/namespace.yaml -f ./k8s/resourcequota.yaml -f ./k8s/deployment.yaml

kubectl get resourcequota -n dev

kubectl get resourcequota resource-quota-test -n dev -o yaml

kubectl describe namespace dev
kubectl describe resourcequota resource-quota-test -n dev

kubectl describe deployment deployment-test -n dev

kubectl get rs -n dev

kubectl describe rs deployment-test-6886d76676 -n dev

# Añadimos los límites al nuestros Pods

kubectl apply -f ./k8s/namespace.yaml -f ./k8s/resourcequota.yaml -f ./k8s/deployment.yaml

kubectl get pods -n dev

kubectl describe deployment deployment-test -n dev
kubectl get deployment deployment-test -n dev -o yaml

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/resourcequota.yaml -f ./k8s/namespace.yaml