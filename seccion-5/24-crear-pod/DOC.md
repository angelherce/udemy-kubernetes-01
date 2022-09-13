> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 24 - ¡Manos a la obra! Crea tu primer Pod

## Crear un Pod en Kubernetes

Para crear un Pod utilizaremos el siguiente comando:

```bash
kubectl run <POD_NAME> --image=<IMAGE_NAME:TAG_NAME>
```

**NOTA:*  
En el video utiliza el siguiente comando, pero a mi no me reconoce el flag `--generator`.

```bash
kubectl run --generator=run-pod/v1 <POD_NAME> --image=<IMAGE_NAME:TAG_NAME>
``` 

Para comprobar que el Pod se ha creado podemos utilizar el siguiente comando que listará los Pods que hay en Kubernetes:

```bash
kubectl get pods
``` 