kubectl apply -f ./k8s/deployment.yaml

kubectl rollout status deployment deployment-test

kubectl rollout history deployment deployment-test

kubectl rollout undo deployment deployment-test --to-revision=1

kubectl delete -f ./k8s/deployment.yaml