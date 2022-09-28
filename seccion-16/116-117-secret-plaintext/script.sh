kubectl create secret generic my-secret --from-file=./k8s/secret/test.txt

kubectl get secrets

kubectl describe secret my-secret

kubectl get secret my-secret -o yaml

echo example | base64

echo c2VjcmV0MSA9IGhvbGENCnNlY3JldDIgPSBhZGlvcw== | base64 --decode

kubectl delete secret my-secret