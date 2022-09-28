envsubst < ./k8s/secret.yaml > ./k8s/secret-tmp.yaml

kubectl apply -f ./k8s/secret-tmp.yaml

kubectl get secrets

kubectl describe secret my-secret

kubectl get secret my-secret -o yaml

kubectl delete -f ./k8s/secret-tmp.yaml