kubectl apply -f ./k8s/pod.yaml

kubectl get pod

kubectl exec -it podtest -- sh
touch /var/log/nginx/test.log
pkill nginx

kubectl get pod

kubectl exec -it podtest -- sh
ls /var/log/nginx
exit

kubectl delete -f ./k8s/pod.yaml