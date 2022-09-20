> _**Sección 7:** Deployments - ¡Aprende a hacer Rollouts & Roolbacks como un Pro!_

# Video 48 - Histórico y revisiones de despliegues

Crearemos un fichero `YAML` especificando el Deployment que queremos crear.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: frontend
spec:
  revisionHistoryLimit: 1
  replicas: 3
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
          # image: nginx:stable-alpine
          ports:
            - containerPort: 90
```

Para crear este recurso utilizaremos el siguiente comando:

```bash
kubectl apply -f <YAML_FILE_PATH>
```

Para listar los deploymens utilizaremos el siguiente comando:

```bash
kubectl get deployment
```

Si se quiere observar las etiquetas en el listado utilizaremos el flag `--show-labels`:

```bash
kubectl get deployment --show-labels
```

Para observar el estado del deployment utilizaremos el siguiente comando:

```bash
kubectl rollout status deployment <DEPLOYMENT_NAME>
```

Observar el historico y las revisiones de los despliegues:

```bash
kubectl rollout history deployment <DEPLOYMENT_NAME>
```

Ver la información de un Deployment:

```bash
kubectl describe deployment <DEPLOYMENT_NAME>
```

Ver el manifiesto de un Deployment:

```bash
kubectl get deployment <DEPLOYMENT_NAME> -o yaml
```

Para eliminar el deployment:

```bash
kubectl delete -f <YAML_FILE_PATH>
```