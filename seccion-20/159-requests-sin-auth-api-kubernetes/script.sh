kubectl apply -f ./k8s/pod.yaml

kubectl get svc
kubectl exec -it podtest -- sh
apk add curl
curl https://kubernetes/api/v1/default/pods --insecure
exit

kubectl delete -f ./k8s/pod.yaml