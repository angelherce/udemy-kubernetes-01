kubectl apply -f ./k8s/volume.yaml -f ./k8s/deployment.yaml

kubectl get pv
kubectl get pvc
kubectl get deploy
kubectl get pod

kubectl describe pv pv-volume | grep -i 'reclaim policy:'

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/volume.yaml