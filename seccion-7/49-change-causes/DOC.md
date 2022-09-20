> _**Sección 7:** Deployments - ¡Aprende a hacer Rollouts & Roolbacks como un Pro!_

# Video 49 - Change-Cause - ¿Cambiaste algo?

Crearemos un fichero `YAML` especificando el Deployment que queremos crear.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: frontend
spec:
  revisionHistoryLimit: 10
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

Observar el historico y las revisiones de los despliegues:

```shell
kubectl rollout history deployment <DEPLOYMENT_NAME>
```

Observar una revisión del histórico

```shell
kubectl rollout history deployment <DEPLOYMENT_NAME> --revision=<REVISION_NUMBER>
```

Establecer un mensaje en el apartado "CHANGE-CAUSE" del histórico:

1. Utilizar el flag `--record`. Esto guardará automáticamente el comando que se ha utilizado.
    
    ```shell
    kubectl apply -f <YAML_FILE_PATH>  --record
    ```

2. Establecer en el fichero YAML la anotación:
    
    ```yaml
    metadata:
      annotations:
        kubernetes.io/change-cause: "Mensaje con los cambios del Deployment"
    ```
   
    ```shell
    kubectl apply -f <YAML_FILE_PATH>
    ```
   
3. Establecer la anotación anterion a través de comandos:

    ```shell
    kubectl apply -f <YAML_FILE_PATH>
    ```

    ```yaml
    kubectl annotate deployment <DEPLOYMENT_NAME> kubernetes.io/change-cause='Mensaje con los cambios del Deployment'
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