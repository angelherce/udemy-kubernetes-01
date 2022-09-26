> _**Sección 11:** Limita la Ram y la CPU que pueden usar tus pods_

# Video [83-85] - Limits & Requests
> **Video 83:** _¿Qué sucede si un pod supera el request pero no el límite en RAM?_  
> **Video 84:** _¿Qué sucede si un pod supera el límite de RAM?_  
> **Video 85:** _¿Qué sucede si ningún nodo tiene la RAM solicitada por un pod?_

Cuando especificas un Pod, opcionalmente puedes especificar los recursos que necesita un Contenedor, si estos límites no se especifícan pueden generar problemas ya que los Pods podrían consumir el total de los recursos del clúster y tirarnos todo abajo.  

Los recursos que normalmente se definen son CPU y memoria (RAM).  

Cuando especificas el recurso request para Contenedores en un Pod, el Scheduler de Kubernetes usa esta información para decidir en qué nodo colocar el Pod. Cuando especificas el recurso limit para un Contenedor, Kubelet impone estos límites, así que el contenedor no puede utilizar más recursos que el límite que le definimos. Kubelet también reserva al menos la cantidad especificada en request para el contenedor.  

[source](https://kubernetes.io/es/docs/concepts/configuration/manage-resources-containers/)

## 1- YAML

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: memory-test-mayorquerequest-menorquelimit
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
---
apiVersion: v1
kind: Pod
metadata:
  name: memory-test-mayorquelimit
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
      args: ['--vm', '1', '--vm-bytes', '250M', '--vm-hang', '1']
---
apiVersion: v1
kind: Pod
metadata:
  name: memory-test-1000gi
spec:
  containers:
    - name: stress
      image: polinux/stress
      resources:
        limits:
          memory: '1000Gi'
        requests:
          memory: '1000Gi'
      command: ['stress']
      args: ['--vm', '1', '--vm-bytes', '50M', '--vm-hang', '1']
```