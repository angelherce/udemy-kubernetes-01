> _**Sección 13:** ResourceQuota - Agrega límites a nivel de Namespace_

# Video 96 - Intenta sobrepasar los límites de tu ResourceQuota

Cuando varios usuarios o equipos comparten un clúster con un número fijo de nodos, existe la preocupación de que un equipo pueda usar más recursos de los que le corresponden.

Las cuotas de recursos son una herramienta para que los administradores aborden esta inquietud.

Una cuota de recursos, definida por el objeto `ResourceQuota`, proporciona restricciones que limitan el consumo de recursos agregados por espacio de nombres. Puede limitar la cantidad de objetos que se pueden crear en un espacio de nombres por tipo, así como la cantidad total de recursos informáticos que pueden consumir los recursos de ese espacio de nombres.

[source](https://kubernetes.io/docs/concepts/policy/resource-quotas/)

## 1- _Teoría_

- Para crear un Pod cuando hay un ResourceQuota, se debe establecer los límites del Pod.

## 2- _YAML_

**Namespace**
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
  labels:
    name: dev
```

---

**ResourceQuota**
```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: resource-quota-test
  namespace: dev
spec:
  hard:
    limits.cpu: '2'
    limits.memory: '2Gi'
    requests.cpu: '1'
    requests.memory: '1Gi'
```

---

**Deployment**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  namespace: dev
  labels:
    app: backend
spec:
  replicas: 2
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
          resources:
            requests:
              memory: '500M'
              cpu: '500m'
            limits:
              memory: '500M'
              cpu: '500m'
```

## 3- _Comandos_

- Aplicar manifiesto de Kubernetes

```shell
kubectl apply -f <YAML_FILE_PATH>
```

- Listar los ResourceQuota

```shell
kubectl get resourcequota
```

- Listar los ResourceQuota de un namespace en concreto

```shell
kubectl get resourcequota -namespace <NAMESPACE_NAME>
```

```shell
kubectl get resourcequota -n <NAMESPACE_NAME>
```

- Ver el manifiesto de un ResourceQuota

```shell
kubectl get resourcequota <RESOURCEQUOTA_NAME> -o yaml
```

```shell
kubectl get resourcequota <RESOURCEQUOTA_NAME> -namespace <NAMESPACE_NAME>  -o yaml
```

```shell
kubectl get resourcequota <RESOURCEQUOTA_NAME> -n <NAMESPACE_NAME>  -o yaml
```

- Ver la información de un ResourceQuota

```shell
kubectl describe resourcequota <RESOURCEQUOTA_NAME>
```

```shell
kubectl describe resourcequota <RESOURCEQUOTA_NAME> -namespace <NAMESPACE_NAME>
```

```shell
kubectl describe resourcequota <RESOURCEQUOTA_NAME> -n <NAMESPACE_NAME>
```

- Eliminar recursos desde un manifiesto de Kubernetes

```shell
kubectl delete -f <YAML_FILE_PATH>
```