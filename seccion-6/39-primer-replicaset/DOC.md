> _**Sección 6:** ReplicaSets - Aprende a garantizar réplicas en tus Pods_

# Video 39 - Tu primer ReplicaSet

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