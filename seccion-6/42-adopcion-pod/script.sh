# kubectl run --generator=run-pod/v1 podtest1 --image=nginx:alpine
# kubectl run --generator=run-pod/v1 podtest2 --image=nginx:alpine

kubectl run podtest1 --image=nginx:alpine
kubectl run podtest2 --image=nginx:alpine

kubectl get pods

kubectl label pods podtest1 app=pod-label

kubectl get pods -l app=pod-label

kubeclt get pods podtest1 -o yaml

kubectl apply -f ./k8s/rs.yaml

kubectl get pods -l app=pod-label

kubeclt get pods podtest1 -o yaml

kubeclt get rs rs-test -o yaml

kubectl delete -f ./k8s/rs.yaml