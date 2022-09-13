> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 26 - Aprende a eliminar Pods

## Listar los recursos de la API de Kubernetes
```bash
kubectl api-resources
```

## Utilizar los shortnames de los recursos de la API
Veamos otra manera de mostrar los Pods en el clúster de Kubernetes:
```bash
kubectl get pods
```

```bash
kubectl get po
```

## Eliminar un Pod
```bash
kubectl delete <POD_NAME>
```