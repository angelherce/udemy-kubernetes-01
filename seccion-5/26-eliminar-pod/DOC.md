> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 26 - Aprende a eliminar Pods

## Listar los recursos de la API de Kubernetes
```shell
kubectl api-resources
```

## Utilizar los shortnames de los recursos de la API
Veamos otra manera de mostrar los Pods en el clúster de Kubernetes:
```shell
kubectl get pods
```

```shell
kubectl get po
```

## Eliminar un Pod
```shell
kubectl delete <POD_NAME>
```