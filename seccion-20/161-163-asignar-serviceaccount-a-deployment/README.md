> _**Sección 20:** Role Based Access Control: Service Account_

# Video [161-163] - Asigna un ServiceAccount a un Deployment

## 1- _Teoría_

El ServiceAccount es usado en Kubernetes para proporcionar una identidad a los pods. Todo Pod que quiera interaccionar con el API Server deberá de autenticarse con un particular ServiceAccount. Por defecto, se usa el default.

[source](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

## 2- _YAML_

Role
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: default
rules:
  - apiGroups: ['']
    resources: ['pods']
    verbs: ['get', 'list', 'watch']
  - apiGroups: ['apps']
      resources: ['deployments', 'replicasets']
      verbs: ['get', 'list', 'watch']
```
---
ServiceAccount
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
```
---
Role
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: service-account-pod-reader
  namespace: default
subjects:
  - kind: ServiceAccount
    name: my-service-account
    apiGroup: ''
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```
---
Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      serviceAccountName: my-service-account
      containers:
        - name: nginx
          image: nginx:alpine
          ports:
            - containerPort: 80
```

## 3- _Comandos_

- Aplicar un manifiesto de Kubernetes

```shell
kubectl apply -f <YAML_FILE_PATH>
```

- Listar todos los ServiceAccount

```shell
kubectl get serviceaccount
```

```shell
kubectl get sa
```

- Listar todos los ServiceAccount de un namespace

```shell
kubectl get serviceaccount --namespace <NAMESPACE_NAME>
```

```shell
kubectl get serviceaccount -n <NAMESPACE_NAME>
```

- Ver la información de un ServiceAccount

```shell
kubectl describe serviceaccount <SERVICEACCOUNT_NAME>
```

```shell
kubectl describe sa <SERVICEACCOUNT_NAME>
```

- Ver el manifiesto de Kubernetes en formato yaml de un ServiceAccount

```shell
kubectl describe serviceaccount <SERVICEACCOUNT_NAME> -o yaml
```

```shell
kubectl describe sa <SERVICEACCOUNT_NAME> -o yaml
```

- Ver el manifiesto de Kubernetes en formato json de un ServiceAccount

```shell
kubectl describe serviceaccount <SERVICEACCOUNT_NAME> -o json
```

```shell
kubectl describe sa <SERVICEACCOUNT_NAME> -o json
```

- Eliminar los recursos desde un manifiesto de Kubernetes

```shell
kubectl delete -f <YAML_FILE_PATH>
```