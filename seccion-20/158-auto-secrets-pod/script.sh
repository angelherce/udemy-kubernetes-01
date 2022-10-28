kubectl apply -f ./k8s/pod.yaml

kubectl get secrets
kubectl get pod podtest -o yaml | grep -i serviceAccountName:
kubectl get pod podtest -o yaml | grep -i -A 5 volumes:
kubectl get pod podtest -o yaml | grep -i -A 5 volumeMounts:
kubectl exec -it podtest -- sh
ls /var/run
ls /var/run/secrets/kubernetes.io/serviceaccount
cat /var/run/secrets/kubernetes.io/serviceaccount/ca.cert
cat /var/run/secrets/kubernetes.io/serviceaccount/token
cat /var/run/secrets/kubernetes.io/serviceaccount/namespace
exit

kubectl delete -f ./k8s/pod.yaml