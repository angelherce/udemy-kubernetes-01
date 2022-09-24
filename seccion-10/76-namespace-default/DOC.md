> _**Sección 10:** Namespaces & Context - Aprende a organizar y a aislar los recursos en tu cluster_

# Video 76 - Namespaces por defecto

Los espacios de nombres (namespaces) de Kubernetes son múltiples clústeres virtuales respaldados por el mismo clúster físico.  

[source](https://kubernetes.io/es/docs/concepts/overview/working-with-objects/namespaces/)

## 1- Teoría

- Cuando se crea un pod y no se le especifica un namespaces, siempre se le establece en el namespace `default`.

## 2- Comandos

- Listar los namespaces

```shell
kubectl get namespaces
```

- Listar los pods de un namespaces

```shell
kubectl get pod --namespace <NAMESPACE_NAME>
```

```shell
kubectl get pod -n <NAMESPACE_NAME>
```

- Listar todos los elementos de un namespaces

```shell
kubectl get all --namespace <NAMESPACE_NAME>
```

```shell
kubectl get all -n <NAMESPACE_NAME>
```

