kubectl apply -f ./k8s/config.yaml -f ./k8s/deployment.yaml

#kubectl get configmap
kubectl get cm

#kubectl describe configmap nginx-conf
kubectl describe cm nginx-conf
kubectl describe cm variables

kubectl get pod

kubectl exec -it deployment-test-588f465d67-pxn6d -- sh

ls /etc/nginx/conf.d
cat /etc/nginx/conf.d/default.conf

env | grep -i db_

exit

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/config.yaml