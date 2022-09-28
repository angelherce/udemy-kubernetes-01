kubectl apply -f ./k8s/secret.yaml -f ./k8s/deployment.yaml

kubectl get secrets

kubectl describe secret my-secret

kubectl get secret my-secret -o yaml

kubectl get pod

kubectl exec deployment-test-f86655d7-5w5rb  -- sh -c env | grep -i secret_

kubectl delete -f ./k8s/deployment.yaml -f ./k8s/secret.yaml