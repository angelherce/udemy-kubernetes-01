kubectl apply -f ./k8s/deployment.yaml

kubectl rollout status deployment deployment-test

kubectl rollout history deployment deployment-test

kubectl apply -f ./k8s/deployment.yaml  --record

kubectl rollout history deployment deployment-test

kubectl apply -f ./k8s/deployment.yaml

kubectl rollout history deployment deployment-test

kubectl apply -f ./k8s/deployment.yaml

kubectl annotate deployment deployment-test kubernetes.io/change-cause='Changes de port to 80, changes the history limit to 10, changes replicas to 5 and delete annotation "change-cause" from yaml file'

kubectl rollout history deployment deployment-test

kubectl rollout history deployment deployment-test --revision=3