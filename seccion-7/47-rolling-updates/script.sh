kubectl apply -f ./k8s/deployment.yaml

kubectl rollout status deployment deployment-test

kubectl describe deployment deployment-test

kubectl delete -f ./k8s/deployment.yaml