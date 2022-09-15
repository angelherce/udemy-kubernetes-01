> _**Sección 6:** ReplicaSets - Aprende a garantizar réplicas en tus Pods_

# Video 40 - Verifica el funcionamiento de un ReplicaSet

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

```bash
kubectl apply -f <YAML_FILE_PATH>
```

Se pueden listar los ReplicaSet creados en el Clúster con el siguiente comando:

```bash
kubectl get replicaset
```

```bash
kubectl get rs
```

Comprobamos que se han creado los 5 Pods en el Clúster. Estos Pods se encuentran ahora en propiedad del ReplicaSet.

```bash
kubectl get pods -l <LABEL_NAME>=<LABEL_VALUE>
```

Ahora si eliminamos un Pod, el ReplicaSet actuará levantando otro para mantener que siempre haya el mismo número de replicas de los Pods que se han configurado en el ReplicaSet.

```bash
kubectl delete pod <POD_NAME>
```

Si editamos el fichero `YAML` del ReplicaSet y establecemos otro número de réplicas, por ejemplo:

```yaml
  replicas: 2
```

Ahora si volvemos a ejecutar el siguiente comando, podremos ver como el ReplicaSet se carga los Pods necesarios para que hayan el número de Pods que se ha establecido.

```bash
kubectl apply -f <YAML_FILE_PATH>
```