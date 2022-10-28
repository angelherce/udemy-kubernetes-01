kubectl apply -f ./k8s/pod.yaml

kubectl get svc
kubectl exec -it podtest -- sh
apk add curl
curl https://kubernetes/api/v1 --insecure
cat /var/run/secrets/kubernetes.io/serviceaccount/token
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
echo $TOKEN
curl -H "Authorization: Bearer ${TOKEN}" https://kubernetes/api/v1 --insecure
exit

kubectl delete -f ./k8s/pod.yaml