> _**Sección 7:** Deployments - ¡Aprende a hacer Rollouts & Roolbacks como un Pro!_

# Video 45 - Tu primer Deployment

Crearemos un fichero `YAML` especificando el Deployment que queremos crear.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: frontend
spec:
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
          ports:
            - containerPort: 80
```

Para crear este recurso utilizaremos el siguiente comando:

```shell
kubectl apply -f <YAML_FILE_PATH>
```

Para listar los deploymens utilizaremos el siguiente comando:

```shell
kubectl get deployment
```

Si se quiere observar las etiquetas en el listado utilizaremos el flag `--show-labels`:

```shell
kubectl get deployment --show-labels
```

Para observar el estado del deployment utilizaremos el siguiente comando:

```shell
kubectl rollout status deployment <DEPLOYMENT_NAME>
```

Ver la información de un Deployment:

```shell
kubectl describe deployment <DEPLOYMENT_NAME>
```

Ver el manifiesto de un Deployment:

```shell
kubectl get deployment <DEPLOYMENT_NAME> -o yaml
```

Para eliminar el deployment:

```shell
kubectl delete -f <YAML_FILE_PATH>
```