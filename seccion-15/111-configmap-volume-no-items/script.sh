kubectl apply -f ./k8s/config.yaml -f ./k8s/deployment.yaml

#kubectl get configmap
kubectl get cm

#kubectl describe configmap nginx-conf
kubectl describe cm nginx-conf

kubectl get pod

kubectl exec -it deployment-test-58cdb947b6-2fn76 -- sh

ls /etc/nginx/conf.d

cat /etc/nginx/conf.d/nginx
cat /etc/nginx/conf.d/test

exit

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/config.yaml