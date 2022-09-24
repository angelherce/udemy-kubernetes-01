> _**Sección 10:** Namespaces & Context - Aprende a organizar y a aislar los recursos en tu cluster_

# Video 77 - Crea tu primer namespace

Los espacios de nombres (namespaces) de Kubernetes son múltiples clústeres virtuales respaldados por el mismo clúster físico.  

[source](https://kubernetes.io/es/docs/concepts/overview/working-with-objects/namespaces/)

## 1- Teoría

- Cuando se crea un pod y no se le especifica un namespaces, siempre se le establece en el namespace `default`.

## 2- Manifiesto

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: development
  labels:
    name: development
```

## 3- Comandos

- Listar los namespaces

```shell
kubectl get namespaces
```

```shell
kubectl get ns
```

- Listar los namespaces mostrando sus etiquetas

```shell
kubectl get namespaces --show-labels
```

```shell
kubectl get ns --show-labels
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

- Crear un namespace

```shell
kubectl create namespace <NAMESPACE_NAME>
```

```shell
kubectl create ns <NAMESPACE_NAME>
```

- Ver información del namespace

```shell
kubectl describe namespace <NAMESPACE_NAME>
```

```shell
kubectl describe ns <NAMESPACE_NAME>
```

- Ver YAML del namespace

```shell
kubectl get namespace <NAMESPACE_NAME> -o yaml
```

```shell
kubectl get ns <NAMESPACE_NAME> -o yaml
```

- Aplicar manifiesto del namespace

```shell
kubectl apply -f <YAML_FILE_PATH>
```

- Eliminar namespace desde un manifiesto

```shell
kubectl delete -f <YAML_FILE_PATH>
```