kubectl apply -f ./k8s/pod.yaml

kubectl exec pod/podtest -- sh -c env | grep -i my_

kubectl delete -f ./k8s/pod.yaml