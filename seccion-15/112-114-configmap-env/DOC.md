> _**Sección 15:** ConfigMaps & Environment Variables - Inyecta datos en tus Pods_

# Video [112-114] - Crea un ConfigMap nuevo para inyectarlo como una variable de entorno

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
  default.conf: |
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
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: variables
  labels:
    app: backend
data:
  db.host: 'dev.host.local'
  db.user: 'dev_user'
  db.pass: '123456'
  script: |
    echo DB host es $DB_HOST, DB user es $DB_USER y DB pass es $DB_PASS > /usr/share/nginx/html/test.html
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
          env:
            - name: DB_HOST
              valueFrom:
                configMapKeyRef:
                  name: variables
                  key: db.host
            - name: DB_USER
              valueFrom:
                configMapKeyRef:
                  name: variables
                  key: db.user
            - name: DB_PASS
              valueFrom:
                configMapKeyRef:
                  name: variables
                  key: db.pass
          volumeMounts:
            - name: vol-config
              mountPath: /etc/nginx/conf.d
            - name: vol-script
              mountPath: /opt
      volumes:
        - name: vol-config
          configMap:
            name: nginx-conf
        - name: vol-script
          configMap:
            name: variables
            items:
              - key: script
                path: script.sh
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