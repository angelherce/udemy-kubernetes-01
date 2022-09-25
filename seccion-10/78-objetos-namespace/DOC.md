> _**Sección 10:** Namespaces & Context - Aprende a organizar y a aislar los recursos en tu cluster_

# Video 78 - Objetos en un Namespace

Los espacios de nombres (namespaces) de Kubernetes son múltiples clústeres virtuales respaldados por el mismo clúster físico.  

[source](https://kubernetes.io/es/docs/concepts/overview/working-with-objects/namespaces/)

## 1- Teoría

- Cuando se crea un pod y no se le especifica un namespaces, siempre se le establece en el namespace `default`.

## 2- Manifiesto

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
  labels:
    name: dev
---
apiVersion: v1
kind: Namespace
metadata:
  name: pro
  labels:
    name: pro
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-dev
  namespace: dev
  labels:
    app: frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-pro
  namespace: pro
  labels:
    app: backend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
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

- Listar los recursos de un namespaces

```shell
kubectl get <RESOURCE_NAME> --namespace <NAMESPACE_NAME>
```

```shell
kubectl get <RESOURCE_NAME> -n <NAMESPACE_NAME>
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

- Crear un pod en un namespace

```shell
kubectl run <POD_NAME> --image=<IMAGE_NAME>:<IMAGE_TAG> -namespace <NAMESPACE_NAME>
```

```shell
kubectl run <POD_NAME> --image=<IMAGE_NAME>:<IMAGE_TAG> -n <NAMESPACE_NAME>
```