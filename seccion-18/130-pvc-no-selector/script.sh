kubectl apply -f ./k8s/pv.yaml -f ./k8s/pvc.yaml

#kubectl get persistentvolume
kubectl get pv

#kubectl get persistentvolumeclaim
kubectl get pvc

#kubectl describe persistentvolume pv-volume
kubectl describe pv pv-volume

#kubectl describe persistentvolumeclaim pvc-volume
kubectl describe pvc pvc-volume

#kubectl get persistentvolume pv-volume -o yaml
kubectl get pv pv-volume -o yaml

#kubectl get persistentvolumeclaim pvc-volume -o yaml
kubectl get pvc pvc-volume -o yaml

kubectl delete -f ./k8s/pvc.yaml -f ./k8s/pv.yaml