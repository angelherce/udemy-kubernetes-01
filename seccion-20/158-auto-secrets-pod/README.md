> _**Sección 20:** Role Based Access Control: Service Account_

# Video 158 - Secretos montados automáticamente en Pods

## 1- _Teoría_

El ServiceAccount es usado en Kubernetes para proporcionar una identidad a los pods. Todo Pod que quiera interaccionar con el API Server deberá de autenticarse con un particular ServiceAccount. Por defecto, se usa el default.

[source](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

## 2- _YAML_

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
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