> _**Sección 8:** Service & Endpoints - Kubernetes Service Discovery_

# Video 54 - Describe tu servicio y encuentra información útil

Crearemos un fichero `YAML` especificando el Deployment que queremos crear.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: frontend
spec:
  revisionHistoryLimit: 5
  replicas: 5
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
          image: nginx:stable-alpine
          ports:
            - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: service-test
  labels:
    app: frontend
spec:
  selector:
    app: frontend
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 80
```

Para crear este recurso utilizaremos el siguiente comando:

```bash
kubectl apply -f <YAML_FILE_PATH>
```

Para listar los servicios utilizaremos el siguiente comando:

```bash
kubectl get service
```

```bash
kubectl get svc
```

Si queremos filtrar por etiquetas el listado de los servicios utilizaremos el flag `-l`:

```bash
kubectl get service -l <LABEL_NAME>=<LABEL_VALUE>
```

```bash
kubectl get svc -l <LABEL_NAME>=<LABEL_VALUE>
```

Si queremos filtrar por cualquier otro campo del manifiesto de Kubernetes el listado de los servicios utilizaremos el flag `-field-selecto`:

```bash
kubectl get service --field-selector <FIELD_NAME>=<FIELD_VALUE>
```

```bash
kubectl get svc --field-selector <FIELD_NAME>=<FIELD_VALUE>
```

Si se quiere observar las etiquetas en el listado utilizaremos el flag `--show-labels`:

```bash
kubectl get service --show-labels
```

```bash
kubectl get svc --show-labels
```

Ver la información de un Service:

```bash
kubectl describe service <SERVICE_NAME>
```

Ver el manifiesto de un Service:

```bash
kubectl get service <SERVICE_NAME> -o yaml
```

Para eliminar el recurso:

```bash
kubectl delete -f <YAML_FILE_PATH>
```