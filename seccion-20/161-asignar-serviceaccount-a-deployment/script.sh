kubectl apply -f ./k8s/rbac/service-account.yaml
kubectl apply -f ./k8s/deployment.yaml

kubectl get svc
kubectl get pod deployment-test- -o yaml | grep -i serviceAccountName:
kubectl get pod deployment-test- -o yaml | grep -i -A 5 volumes:
kubectl get pod deployment-test- -o yaml | grep -i -A 5 volumeMounts:
kubectl exec -it deployment-test- -- sh
apk add curl
curl https://kubernetes/api/v1 --insecure
cat /var/run/secrets/kubernetes.io/serviceaccount/token
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
echo $TOKEN
curl -H "Authorization: Bearer ${TOKEN}" https://kubernetes/api/v1 --insecure
curl -H "Authorization: Bearer ${TOKEN}" https://kubernetes/api/v1/namespaces/default/pods --insecure
exit

kubectl delete -f ./k8s/deployment.yaml
kubectl delete -f ./k8s/rbac/service-account.yaml