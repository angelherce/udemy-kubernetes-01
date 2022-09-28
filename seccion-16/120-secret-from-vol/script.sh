kubectl apply -f ./k8s/secret.yaml -f ./k8s/deployment.yaml

kubectl get secrets

kubectl describe secret my-secret

kubectl get secret my-secret -o yaml

kubectl get pod

kubectl exec -it deployment-test-784887d868-5wmh5 -- sh

ls /opt

cat /opt/user.txt
cat /opt/pass.txt

exit

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/secret.yaml