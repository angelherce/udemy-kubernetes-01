kubectl apply -f ./k8s/config.yaml -f ./k8s/deployment.yaml

#kubectl get configmap
kubectl get cm

#kubectl describe configmap nginx-conf
kubectl describe cm nginx-conf

kubectl get pod

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/config.yaml