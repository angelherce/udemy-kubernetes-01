> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 33 - Manifiestos de Kubernetes - Primer acercamiento

Podemos crear un fichero YAML con los recursos que queremos crear en el clúster de Kubernetes. Se pueden crear varios recursos siempre y cuando los separemos por 3 guiones `---`.

Para ver que versiones de la API de Kubernetes podemos utilizar, podemos ejecuar el comando `kubectl api-versions`.

Para ver que clase de recurso podemos crear, ejecutamos el comando `kubectl api-resources`.

Veamos el siguiente fichero YAML en el que se crean un par de Pods simples:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podtest
spec:
  containers:
    - image: nginx:alpine
      name: nginex
---
apiVersion: v1
kind: Pod
metadata:
  name: podtest2
spec:
  containers:
    - image: nginx:alpine
      name: nginex
```

Ahora para crear los recursos especificados en el fichero YAML, utilizaremos el siguiente comando:

```bash
kubectl apply -f <YAML_FILE_PATH>
```

Obtener la IP del Pod a través del siguiente comando

```bash
kubectl describe pod <POD_NAME> | grep IP
```

Si no tenemos visibilidad desde nuestra máquina al Pod a través de la IP de éste, es probable que se haya creado el clúster con algún driver como VirtualBox o HyperV y seguramente no puedas ver la IP del Pod por que se encuentran en máquinas diferentes a tu localhost.

Podremos solucionar esto utilizando el siguiente comando:

```bash
kubectl port-forward <POD_NAME> <PORT_LOCALHOST>:<PORT_POD>
```

Finalmente, para eliminar los recursos especificados en el fichero YAML, utilizaremos el siguiente comando:

```bash
kubectl delete -f <YAML_FILE_PATH>
```