kubectl apply -f ./k8s/manifest-dns.yaml

kubectl get ns

kubectl get deploy -n dev

kubectl get svc -n dev

kubectl get pod -n dev

kubectl run --rm -it podtest --image=nginx:alpine -n default -- sh

apk add -U curl

curl svc-app-backend-dev.dev.svc.cluster.local:8080

kubectl delete -f ./k8s/manifest-dns.yaml