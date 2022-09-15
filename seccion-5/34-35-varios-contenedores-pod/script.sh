docker run --net host -it python:3.6-alpine sh
python -m http.server 8080
curl http://localhost:8080

kubectl apply -f ./k8s/manifest/pods.yaml
kubectl port-forwad podtest 8081:8081 8082:8082
curl http://localhost:8081
curl http://localhost:8082
kubectl delete -f ./k8s/manifest/pods.yaml