kubectl apply -f ./k8s/namespace.yaml

kubectl run podtest --image=nginx:alpine --namespace development

kubectl get pods

kubectl get pods -n development

kubectl delete pod podtest -n development

kubectl delete -f ./k8s/namespace.yaml

kubectl apply -f ./k8s/namespace.yaml

kubectl get ns

kubectl run podtest-1 --image=nginx:alpine -n dev

kubectl get pods -n dev

kubectl delete pod podtest-1 -n dev

kubectl apply -f ./k8s/namespace.yaml

kubectl get deployment

kubectl get deployment -n dev

kubectl get deployment -n pro

kubectl get pod -n dev

kubectl get pod -n pro

kubectl delete -f ./k8s/namespace.yaml