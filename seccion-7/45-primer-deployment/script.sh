kubectl api-resources

kubectl apply -f ./k8s/deployment.yaml

kubectl get deployment --show-labels

kubectl get pod --show-labels

kubectl rollout status deployment deployment-test