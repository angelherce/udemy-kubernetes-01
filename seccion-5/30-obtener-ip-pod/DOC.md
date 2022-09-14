> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 30 - Aprende a obtener la IP de un Pod

Localizamos la IP del Pod en el apartado `IP` de la respuesta del siguiente comando:

```bash
kubectl describe pod <POD_NAME>
```

Ahora podremos ver el Pod a través de esta IP. Si no podemos verlo, es probable que se haya creado el clúster con algún driver como VirtualBox o HyperV y seguramente no puedas ver la IP del Pod por que se encuentran en máquinas diferentes a tu localhost.

Podremos solucionar esto utilizando el siguiente comando:

```bash
kubectl port-forward podtest <PORT_LOCALHOST>:<PORT_POD>
```