> _**Sección 10:** Namespaces & Context - Aprende a organizar y a aislar los recursos en tu cluster_

# Video 80 - Aprende a utilizar el contexto

Los espacios de nombres (namespaces) de Kubernetes son múltiples clústeres virtuales respaldados por el mismo clúster físico.  

[source](https://kubernetes.io/es/docs/concepts/overview/working-with-objects/namespaces/)

## 1- Teoría

- Cuando se crea un pod y no se le especifica un namespaces, siempre se le establece en el namespace `default`.
- Si se quiere acceder al pod  de otro namespace a través del DNS, este DNS se formará de la siguiente manera `SERVICE_NAME` + `NAMESPACE_NAME` + `svc.cluster.local`.  
  _**Ej.:**_  

  > **service:** `svc-app-backend-dev`  
  > **namespace:** `dev`  
  > **dns:** `svc-app-backend-dev.dev.svc.cluster.local`

## 2- Contexto
Podemos crear contextos para evitar pasar los flags de los namespaces.

- Ver el contexto actual

```shell
kubectl config current-context
```

- Ver la configuración de los clusters

```shell
kubectl config view
```

- Crear un nuevo contexto en un cluster

```shell
kubectl config set-context <CONTEXT_NAME> \
  --namespace=<NAMESPACE_NAME> \
  --cluster=<CLUSTER_NAME> \
  --user=<CLUSTER_USER_NAME>
```

- Establecer un determinado contexto

```shell
kubectl config use-context <CONTEXT_NAME>
```

## 3- Manifiesto

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
  labels:
    name: dev
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: dep-app-backend-dev
  namespace: dev
  labels:
    app: app
    type: backend
spec:
  replicas: 5
  selector:
    matchLabels:
      app: app
      type: backend
  template:
    metadata:
      labels:
        app: app
        type: backend
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
---
apiVersion: v1
kind: Service
metadata:
  name: svc-app-backend-dev
  namespace: dev
  labels:
    app: app
    type: backend
spec:
  selector:
    app: app
    type: backend
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 80
```

## 4- Comandos

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