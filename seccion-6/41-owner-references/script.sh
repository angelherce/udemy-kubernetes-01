kubectl api-resources

kubectl apply -f ./k8s/rs.yaml

kubectl get rs

kubectl describe rs rs-test

kubectl get rs rs-test -o yaml

kubectl delete -f ./k8s/rs.yaml