kubectl apply -f ./k8s/manifest/pods.yaml

kubectl get pods -l app:backend
kubectl get pods -l app:frontend
kubectl get pods -l env:dev
kubectl get pods -l env:production
kubectl get pods -l app=backend,env=dev
kubectl get pods -l app=backend,env=production
kubectl get pods -l app=frontend,env=dev
kubectl get pods -l app=frontend,env=production

kubectl delete -f ./k8s/manifest/pods.yaml