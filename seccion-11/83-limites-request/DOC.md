> _**Sección 11:** Limita la Ram y la CPU que pueden usar tus pods_

# Video 83 - ¿Qué sucede si un pod supera el request pero no el límite en RAM?

Cuando especificas un Pod, opcionalmente puedes especificar los recursos que necesita un Contenedor, si estos límites no se especifícan pueden generar problemas ya que los Pods podrían consumir el total de los recursos del clúster y tirarnos todo abajo.  

Los recursos que normalmente se definen son CPU y memoria (RAM).  

Cuando especificas el recurso request para Contenedores en un Pod, el Scheduler de Kubernetes usa esta información para decidir en qué nodo colocar el Pod. Cuando especificas el recurso limit para un Contenedor, Kubelet impone estos límites, así que el contenedor no puede utilizar más recursos que el límite que le definimos. Kubelet también reserva al menos la cantidad especificada en request para el contenedor.  

[source](https://kubernetes.io/es/docs/concepts/configuration/manage-resources-containers/)

## 1- YAML

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: memory-test
spec:
  containers:
    - name: stress
      image: polinux/stress
      resources:
        limits:
          memory: '200Mi'
        requests:
          memory: '100Mi'
      command: ['stress']
      args: ['--vm', '1', '--vm-bytes', '150M', '--vm-hang', '1']
```