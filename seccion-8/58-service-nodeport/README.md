> _**Sección 8:** Service & Endpoints - Kubernetes Service Discovery_

# Video 58 - Servicio de tipo NodePort

> **NOTA:** _Si estas utilizando WSL y minikube, para poder acceder al servicio desde tu máquina local tendrémos que habilitar el servicio en minikube:_
>
> ```shell
> minikube service <SERVICE_KUBERNETES_NAME>
> ```

El servicio de tipo `NodePort` hace un servicio accesible desde fuera el clúster.  

Crearemos un fichero `YAML` especificando el Deployment y el Service que queremos crear.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: backend
spec:
  revisionHistoryLimit: 5
  replicas: 5
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
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
    app: backend
spec:
  type: NodePort
  selector:
    app: backend
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 80
```

Para crear este recurso utilizaremos el siguiente comando:

```shell
kubectl apply -f <YAML_FILE_PATH>
```

Para listar los servicios utilizaremos el siguiente comando:

```shell
kubectl get service
```

```shell
kubectl get svc
```

Si queremos filtrar por etiquetas el listado de los servicios utilizaremos el flag `-l`:

```shell
kubectl get service -l <LABEL_NAME>=<LABEL_VALUE>
```

```shell
kubectl get svc -l <LABEL_NAME>=<LABEL_VALUE>
```

Si queremos filtrar por cualquier otro campo del manifiesto de Kubernetes el listado de los servicios utilizaremos el flag `-field-selecto`:

```shell
kubectl get service --field-selector <FIELD_NAME>=<FIELD_VALUE>
```

```shell
kubectl get svc --field-selector <FIELD_NAME>=<FIELD_VALUE>
```

Si se quiere observar las etiquetas en el listado utilizaremos el flag `--show-labels`:

```shell
kubectl get service --show-labels
```

```shell
kubectl get svc --show-labels
```

Obtener los endpoints de un Service:

```shell
kubectl get endpoints <SERVICE_NAME>
```

Ver la información de un Service:

```shell
kubectl describe service <SERVICE_NAME>
```

Ver el manifiesto de un Service:

```shell
kubectl get service <SERVICE_NAME> -o yaml
```

Para eliminar el recurso:

```shell
kubectl delete -f <YAML_FILE_PATH>
```