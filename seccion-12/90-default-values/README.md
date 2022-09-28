> _**Sección 12:** LimitRange - Aprende a controlar el uso de recursos a nivel de objetos_

# Video 90 - Aplica valores por defecto a los pods que no definan límites

Por defecto, los contenedores se ejecutan sin restricciones sobre los recursos informáticos disponibles en un clúster de Kubernetes. Si el Nodo dispone de los recursos informáticos, un Pod o sus Contenedores tienen permitido consumir por encima de la cuota solicitada si no superan el límite establecido en su especificación. Existe la preocupación de que un Pod o Contenedor pueda monopolizar todos los recursos disponibles.  

Un LimitRange es la política que permite:

- Imponer restricciones de requisitos de recursos a Pods o Contenedores por Namespace.

- Imponer las limitaciones de recursos mínimas/máximas para Pods o Contenedores dentro de un Namespace.

- Especificar requisitos y límites de recursos predeterminados para Pods o Contenedores de un Namespace.

- Imponer una relación de proporción entre los requisitos y el límite de un recurso.

- Imponer el cumplimiento de las demandas de almacenamiento mínimo/máximo para Solicitudes de Volúmenes Persistentes.

[source](https://kubernetes.io/es/docs/concepts/policy/limit-range/)

## 1- _YAML_

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
  labels:
    name: dev
---
apiVersion: v1
kind: LimitRange
metadata:
  name: limit-range
  namespace: dev
spec:
  limits:
    - default:
        memory: '512Mi'
        cpu: '1'
      defaultRequest:
        memory: '256Mi'
        cpu: '500m'
      type: Container
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