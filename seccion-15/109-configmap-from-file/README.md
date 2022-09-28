> _**Sección 15:** ConfigMaps & Environment Variables - Inyecta datos en tus Pods_

# Video 109 - Crea un ConfigMap desde un archivo

Un configmap es un objeto de la API utilizado para almacenar datos no confidenciales en el formato clave-valor. Los Pods pueden utilizar los ConfigMaps como variables de entorno, argumentos de la linea de comandos o como ficheros de configuración en un Volumen.

Un ConfigMap te permite desacoplar la configuración de un entorno específico de una imagen de contenedor, así las aplicaciones son fácilmente portables.

[source](https://kubernetes.io/es/docs/concepts/configuration/configmap/)

## 1- _Comandos_

- Crear un ConfigMap desde un archivo

```shell
kubectl create configmap <CONFIGMAP_NAME> --from-file=<FILE_PATH>
```

```shell
kubectl create cm <CONFIGMAP_NAME> --from-file=<FILE_PATH>
```

- Crear un ConfigMap desde varios archivos

```shell
kubectl create configmap <CONFIGMAP_NAME> --from-file=<FOLDER_PATH>
```

```shell
kubectl create cm <CONFIGMAP_NAME> --from-file=<FOLDER_PATH>
```

- Listar todos los ConfigMaps

```shell
kubectl get configmap
```

```shell
kubectl get cm
```

- Listar todos los ConfigMaps de un namespace en concreto

```shell
kubectl get configmap --namespace <NAMESPACE_NAME>
```

```shell
kubectl get configmap -n <NAMESPACE_NAME>
```

- Ver información de un configmap

```shell
kubectl describe configmap <CONFIGMAP_NAME>
```

```shell
kubectl describe cm <CONFIGMAP_NAME>
```

- Ver manifiesto YAML de un configmap

```shell
kubectl get configmap <CONFIGMAP_NAME> -o yaml
```

```shell
kubectl get cm <CONFIGMAP_NAME> -o yaml
```

- Ver manifiesto JSON de un configmap

```shell
kubectl get configmap <CONFIGMAP_NAME> -o json
```

```shell
kubectl get cm <CONFIGMAP_NAME> -o json
```

- Eliminar un configmap

```shell
kubectl delete configmap <CONFIGMAP_NAME>
```

```shell
kubectl delete cm <CONFIGMAP_NAME>
```