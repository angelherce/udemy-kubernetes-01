> _**Sección 16:** Secrets - Aprende a manejar data sensible en Kubernetes_

# Video 119 - Tip: Nunca versiones un yaml con información sensitiva

Un Secret es un objeto que contiene una pequeña cantidad de datos confidenciales como contraseñas, un token, o una llave. Tal información podría ser puesta en la especificación de un Pod o en una imagen; poniendolo en un objeto de tipo Secret permite mayor control sobre como se usa, y reduce el riesgo de exposicición accidental.

Los usuarios pueden crear Secrets, y el sistema también puede crearlos.

Para usar un Secret, un Pod debe hacer referencia a este. Un Secret puede ser usado con un Pod de dos formas: como archivos en un volume montado en uno o más de sus contenedores, o utilizados por el kubelet al extraer imágenes del pod.

[source](https://kubernetes.io/es/docs/concepts/configuration/secret/)

## 1- _YAML_

**Secret - Data**
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  labels:
    type: data
type: Opaque
stringData:
  username: $USER
  password: $PASS
```

```shell
envsubst < <SECRET_YAML_PATH> > <NEW_SECRET_YAML_PATH>
```

---

**Secret - StringData**
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret-stringdata
  labels:
    type: stringdata
type: Opaque
stringData:
  username: 'user'
  password: '123456'
```

## 2- _Comandos_

- Crear un Secret desde un archivo

```shell
kubectl create secret <SECRET_TYPE> <SECRET_NAME> --from-file=<FILE_PATH>
```

- Listar todos los Secrets

```shell
kubectl get secret
```

- Listar todos los Secrets de un namespace en concreto

```shell
kubectl get secret --namespace <NAMESPACE_NAME>
```

```shell
kubectl get secret -n <NAMESPACE_NAME>
```

- Ver información de un Secret

```shell
kubectl describe secret <SECRET_NAME>
```

- Ver manifiesto YAML de un secret

```shell
kubectl get secret <SECRET_NAME> -o yaml
```

- Ver manifiesto JSON de un Secret

```shell
kubectl get secret <SECRET_NAME> -o json
```

- Eliminar un Secret

```shell
kubectl delete secret <SECRET_NAME>
```