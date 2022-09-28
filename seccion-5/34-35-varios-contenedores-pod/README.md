> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 34 - Pods con más de un contenedor
# Video 35 - Solución: Evita utilizar el mismo puerto en los contenedores de un Pod

Fichero `YAML`.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podtest
spec:
  containers:
    - name: cont1
      image: python:3.6-alpine
      command: ['sh', '-c', 'echo "<h1>Hi World from Container 1 !</h1>" > index.html && python -m http.server 8081']
      
    - name: cont2
      image: python:3.6-alpine
      command: ['sh', '-c', 'echo "<h1>Hi World from Container 2 !</h1>" > index.html && python -m http.server 8082']
```

Para crear el Pod utilizaremos el siguiente comando:

```shell
kubectl apply -f <YAML_FILE_PATH>
```

Si queremos acceder a los logs de los contenedores del Pod utilizaremos el siguiente comando:

```shell
kubectl logs <POD_NAME> -c <CONTAINER_NAME>
```

Si queremos acceder a los contenedores del Pod utilizaremos el siguiente comando:

```shell
kubectl exec -it <POD_NAME> -c <CONTAINER_NAME> -- sh
```

Obtener la IP del Pod a través del siguiente comando

```shell
kubectl describe pod <POD_NAME> | grep IP
```

Si no tenemos visibilidad desde nuestra máquina al Pod a través de la IP de éste, es probable que se haya creado el clúster con algún driver como VirtualBox o HyperV y seguramente no puedas ver la IP del Pod por que se encuentran en máquinas diferentes a tu localhost.

Podremos solucionar esto utilizando el siguiente comando:

```shell
kubectl port-forward <POD_NAME> <PORT_LOCALHOST>:<PORT_POD>
```

Para eliminar el Pod utilizaremos el siguiente comando:
```shell
kubectl delete -f <YAML_FILE_PATH>
```