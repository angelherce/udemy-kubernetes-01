kubectl api-resources

kubectl apply -f ./k8s/deployment.yaml

kubectl get deployment --show-labels

kubectl get pod --show-labels

kubectl rollout status deployment deployment-test

kubectl describe deployment deployment-test

kubectl get deployment deployment-test -o yaml