> _**Sección 18:** Kubernetes Volumes - Empty Dir, HostPath, PV, PVC, StorageClasses_

# Video 134 - Storage Class & Provisionamiento Dinámico

## 1- _YAML_

**PersistentVolumeClaim**
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-volume
  labels:
    type: local
spec:
  storageClassName: standard
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: '20Gi'
```

## 2- _Comandos_

- Aplicar un manifiesto de Kubernetes

```shell
kubectl apply -f <YAML_FILE_PATH>
```

- Listar todos los PersistentVolumes

```shell
kubectl get persistenvolume
```

```shell
kubectl get pv
```

- Listar todos los PersistentVolumes de un namespace

```shell
kubectl get persistenvolume --namespace <NAMESPACE_NAME>
```

```shell
kubectl get persistenvolume -n <NAMESPACE_NAME>
```

- Ver la información de un PersistentVolume

```shell
kubectl describe persistenvolume <PERSISTENVOLUME_NAME>
```

```shell
kubectl describe pv <PERSISTENVOLUME_NAME>
```

- Ver el manifiesto de Kubernetes en formato yaml de un PersistentVolume

```shell
kubectl describe persistenvolume <PERSISTENVOLUME_NAME> -o yaml
```

```shell
kubectl describe pv <PERSISTENVOLUME_NAME> -o yaml
```

- Ver el manifiesto de Kubernetes en formato json de un PersistentVolume

```shell
kubectl describe persistenvolume <PERSISTENVOLUME_NAME> -o json
```

```shell
kubectl describe pv <PERSISTENVOLUME_NAME> -o json
```

- Listar todos los PersistentVolumesClaim

```shell
kubectl get persistenvolumeclaim
```

```shell
kubectl get pvc
```

- Listar todos los PersistentVolumesClaim de un namespace

```shell
kubectl get persistenvolumeclaim --namespace <NAMESPACE_NAME>
```

```shell
kubectl get persistenvolumeclaim -n <NAMESPACE_NAME>
```

- Ver la información de un PersistentVolumeClaim

```shell
kubectl describe persistenvolumeclaim <PERSISTENVOLUMECLAIM_NAME>
```

```shell
kubectl describe pvc <PERSISTENVOLUMECLAIM_NAME>
```

- Ver el manifiesto de Kubernetes en formato yaml de un PersistentVolumeClaim

```shell
kubectl describe persistenvolumeclaim <PERSISTENVOLUMECLAIM_NAME> -o yaml
```

```shell
kubectl describe pvc <PERSISTENVOLUMECLAIM_NAME> -o yaml
```

- Ver el manifiesto de Kubernetes en formato json de un PersistentVolumeClaim

```shell
kubectl describe persistenvolumeclaim <PERSISTENVOLUMECLAIM_NAME> -o json
```

```shell
kubectl describe pvc <PERSISTENVOLUMECLAIM_NAME> -o json
```

- Eliminar los recursos desde un manifiesto de Kubernetes

```shell
kubectl delete -f <YAML_FILE_PATH>
```