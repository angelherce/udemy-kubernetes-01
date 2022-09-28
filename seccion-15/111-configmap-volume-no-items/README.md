> _**Sección 15:** ConfigMaps & Environment Variables - Inyecta datos en tus Pods_

# Video 111 - Monta un ConfigMap como un Volumen sin especificar items

Un configmap es un objeto de la API utilizado para almacenar datos no confidenciales en el formato clave-valor. Los Pods pueden utilizar los ConfigMaps como variables de entorno, argumentos de la linea de comandos o como ficheros de configuración en un Volumen.

Un ConfigMap te permite desacoplar la configuración de un entorno específico de una imagen de contenedor, así las aplicaciones son fácilmente portables.

[source](https://kubernetes.io/es/docs/concepts/configuration/configmap/)

## 1- _YAML_

**ConfigMap**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-conf
  labels:
    app: backend
data:
  test: 'Hi World !'
  nginx: |
    server {
        listen 8080;
        server_name localhost;

        location / {
            root /usr/share/nginx/html;
            index index.html index.htm;
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            root /usr/share/nginx/html;
        }
    }
```

---

**Deployment**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: backend
spec:
  replicas: 3
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
          image: nginx:alpine
          volumeMounts:
            - name: vol-config
              mountPath: /etc/nginx/conf.d
      volumes:
        - name: vol-config
          configMap:
            name: nginx-conf
```

## 2- _Comandos_

- Crear un ConfigMap desde un archivo

```shell
kubectl create config <CONFIGMAP_NAME> --from-file=<FILE_PATH>
```

```shell
kubectl create cm <CONFIGMAP_NAME> --from-file=<FILE_PATH>
```

- Crear un ConfigMap desde varios archivos

```shell
kubectl create config <CONFIGMAP_NAME> --from-file=<FOLDER_PATH>
```

```shell
kubectl create cm <CONFIGMAP_NAME> --from-file=<FOLDER_PATH>
```

- Listar todos los ConfigMaps

```shell
kubectl get config
```

```shell
kubectl get cm
```

- Listar todos los ConfigMaps de un namespace en concreto

```shell
kubectl get config --namespace <NAMESPACE_NAME>
```

```shell
kubectl get config -n <NAMESPACE_NAME>
```

- Ver información de un configmap

```shell
kubectl describe config <CONFIGMAP_NAME>
```

```shell
kubectl describe cm <CONFIGMAP_NAME>
```

- Ver manifiesto YAML de un configmap

```shell
kubectl get config <CONFIGMAP_NAME> -o yaml
```

```shell
kubectl get cm <CONFIGMAP_NAME> -o yaml
```

- Ver manifiesto JSON de un configmap

```shell
kubectl get config <CONFIGMAP_NAME> -o json
```

```shell
kubectl get cm <CONFIGMAP_NAME> -o json
```

- Eliminar un configmap

```shell
kubectl delete config <CONFIGMAP_NAME>
```

```shell
kubectl delete cm <CONFIGMAP_NAME>
```