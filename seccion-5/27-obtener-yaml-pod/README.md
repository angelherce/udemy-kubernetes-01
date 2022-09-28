> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 27 - ¿Yaml? ¿Cómo obtengo el Yaml desde un Pod?

## Filtrado de un Pod en concreto del listado
```shell
kubectl get pods <POD_NAME>
```

## Mostrar el `yaml` de la declaración del Pod
````shell
kubectl get pods <POD_NAME> -o yaml
```