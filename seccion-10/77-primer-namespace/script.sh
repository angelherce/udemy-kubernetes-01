kubectl create namespace test-namespace

kubectl get namespace
kubectl get ns

kubectl get namespace --show-labels

kubectl describe namespace test-namespace

kubectl get namespace test-namespace -o yaml

kubectl apply -f ./k8s/namespace.yaml

kubectl get namespace --show-labels

kubectl get pods -n development

kubectl delete -f ./k8s/namespace.yaml

kubectl get namespace --show-labels