> _**Sección 6:** ReplicaSets - Aprende a garantizar réplicas en tus Pods_

# Video 41 - Owner References - Entiende cómo RS se relaciona con los Pods

Crearemos un fichero `YAML` especificando el ReplicaSet que queremos crear.

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: rs-test
  labels:
    app: rs-label
spec:
  replicas: 5
  selector:
    matchLabels:
      app: pod-label
  template:
    metadata:
      labels:
        app: pod-label
    spec:
      containers:
        - name: cont2
          image: python:3.6-alpine
          command: ['sh', '-c', 'echo "<h1>Hi World !</h1>" > index.html && python -m http.server 8080']   
```

Para crear este recurso utilizaremos el siguiente comando:

```shell
kubectl apply -f <YAML_FILE_PATH>
```

Se pueden listar los ReplicaSet creados en el Clúster con el siguiente comando:

```shell
kubectl get replicaset
```

```shell
kubectl get rs
```

Para ver la información del ReplicaSet podemos utilizar el mismo comando que en los Pods.

```shell
kubectl describe rs <REPLICASET_NAME>
```

Podemos ver el manifiesto de un ReplicaSet utilizando el siguiente comando:

```shell
kubectl get rs <REPLICASET_NAME> -o yaml
```

Si vemos el manifiesto de uno de los Pods que creó el ReplicaSet, podremos ver en la sección de metadata el apartado referente a `ownerReferences`, en este apartado veremos la información del ReplicaSet que creamos.

```shell
kubectl get pod <POD_NAME> -o yaml
```

Si nos fijamos en el UID del ReplicaSet, podrémos comprobar que es el mismo que el del ReplicaSet que hemos creado. Podemos ver el UID de nuestro ReplicaSet con el siguiente comando:

```shell
kubectl get rs <REPLICASET_NAME> -o yaml
```