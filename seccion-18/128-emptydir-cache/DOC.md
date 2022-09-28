> _**Sección 18:** Kubernetes Volumes - Empty Dir, HostPath, PV, PVC, StorageClasses_

# Video 128 - ¿Cómo crear un EmptyDir para caché?

## 1- _YAML_

**POD**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podtest
spec:
  containers:
    - name: nginx
      image: nginx:alpine
      volumeMounts:
        - mountPath: /var/log/nginx
          name: cache-volume
  volumes:
    - name: cache-volume
      emptyDir: {}
```

## 2- _Comandos_

- Aplicar un manifiesto de Kubernetes

```shell
kubectl apply -f <YAML_FILE_PATH>
```

- Eliminar los recursos desde un manifiesto de Kubernetes

```shell
kubectl delete -f <YAML_FILE_PATH>
```