> _**Sección 12:** LimitRange - Aprende a controlar el uso de recursos a nivel de objetos_

# Video 93 - Valida el funcionamiento de las políticas de mínimo/máximo de un LimitRange

Por defecto, los contenedores se ejecutan sin restricciones sobre los recursos informáticos disponibles en un clúster de Kubernetes. Si el Nodo dispone de los recursos informáticos, un Pod o sus Contenedores tienen permitido consumir por encima de la cuota solicitada si no superan el límite establecido en su especificación. Existe la preocupación de que un Pod o Contenedor pueda monopolizar todos los recursos disponibles.  

Un LimitRange es la política que permite:

- Imponer restricciones de requisitos de recursos a Pods o Contenedores por Namespace.

- Imponer las limitaciones de recursos mínimas/máximas para Pods o Contenedores dentro de un Namespace.

- Especificar requisitos y límites de recursos predeterminados para Pods o Contenedores de un Namespace.

- Imponer una relación de proporción entre los requisitos y el límite de un recurso.

- Imponer el cumplimiento de las demandas de almacenamiento mínimo/máximo para Solicitudes de Volúmenes Persistentes.

[source](https://kubernetes.io/es/docs/concepts/policy/limit-range/)

## 1- _YAML_

**NameSpace**
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
  labels:
    name: dev
```

---

**LimitRange**
```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: limit-range
  namespace: dev
spec:
  limits:
    - max:
        memory: '1Gi'
        cpu: '1'
      min:
        memory: '100M'
        cpu: '100m'
      type: Container
```

---

**POD**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podtest1
  namespace: dev
  labels:
    app: backend
spec:
  containers:
    - name: cont1
      image: nginx:alpine
      resources:
        limits:
          memory: '500M'
          cpu: '0.5'
        requests:
          memory: '400M'
          cpu: '0.3'
---
apiVersion: v1
kind: Pod
metadata:
  name: podtest2
  namespace: dev
  labels:
    app: backend
spec:
  containers:
    - name: cont1
      image: nginx:alpine
      resources:
        limits:
          memory: '2Gi'
          cpu: '2'
        requests:
          memory: '400M'
          cpu: '0.3'
---
apiVersion: v1
kind: Pod
metadata:
  name: podtest3
  namespace: dev
  labels:
    app: backend
spec:
  containers:
    - name: cont1
      image: nginx:alpine
      resources:
        limits:
          memory: '50M'
          cpu: '50m'
        requests:
          memory: '400M'
          cpu: '0.3'
```

## 2- _Comandos_

- Aplicar manifiesto de Kubernetes

```shell
kubectl apply -f <YAML_FILE_PATH>
```

- Listar los LimitRanges

```shell
kubectl get limitrange
```

- Listar los LimitRanges de un namespace en concreto

```shell
kubectl get limitrange -namespace <NAMESPACE_NAME>
```

```shell
kubectl get limitrange -n <NAMESPACE_NAME>
```

- Ver el manifiesto de un LimitRange

```shell
kubectl get limitrange <LIMITRANGE_NAME> -o yaml
```

```shell
kubectl get limitrange <LIMITRANGE_NAME> -namespace <NAMESPACE_NAME>  -o yaml
```

```shell
kubectl get limitrange <LIMITRANGE_NAME> -n <NAMESPACE_NAME>  -o yaml
```

- Ver la información de un LimitRange

```shell
kubectl describe limitrange <LIMITRANGE_NAME>
```

```shell
kubectl describe limitrange <LIMITRANGE_NAME> -namespace <NAMESPACE_NAME>
```

```shell
kubectl describe limitrange <LIMITRANGE_NAME> -n <NAMESPACE_NAME>
```

- Eliminar recursos desde un manifiesto de Kubernetes

```shell
kubectl delete -f <YAML_FILE_PATH>
```