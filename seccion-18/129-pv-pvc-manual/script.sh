kubectl apply -f ./k8s/volume.yaml

#kubectl get persistentvolume
kubectl get pv

#kubectl describe persistentvolume pv-volume
kubectl describe pv pv-volume

#kubectl get persistentvolume pv-volume -o yaml
kubectl get pv pv-volume -o yaml

kubectl delete -f ./k8s/volume.yaml