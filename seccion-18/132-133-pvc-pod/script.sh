kubectl apply -f ./k8s/pv.yaml -f ./k8s/pvc.yaml -f ./k8s/deployment.yaml

kubectl get pod

kubectl exec -it mysql-6cbd85b6d7-98wtd -- bash

mysql -u root -p123456

create database test;
show databases;

exit
exit

kubectl delete pod mysql-6cbd85b6d7-2gkjm

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

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/pvc.yaml -f ./k8s/pv.yaml