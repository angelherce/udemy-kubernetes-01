> _**Sección 5:** Exporando Pods - Domina los objetos más pequeños en Kubernetes_

# Video 36 - Labels y Pods

Se pueden especificar etiquetas (`metadata.labels`) para nuestros Pods en el fichero `YAML`.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podtest1
  labels:
    app: frontend
    env: production
spec:
  containers:
    - name: nginex
      image: nginx:alpine
---
apiVersion: v1
kind: Pod
metadata:
  name: podtest2
  labels:
    app: frontend
    env: dev
spec:
  containers:
    - name: nginex
      image: nginx:alpine
---
apiVersion: v1
kind: Pod
metadata:
  name: podtest3
  labels:
    app: backend
    env: production
spec:
  containers:
    - name: nginex
      image: nginx:alpine
---
apiVersion: v1
kind: Pod
metadata:
  name: podtest4
  labels:
    app: backend
    env: dev
spec:
  containers:
    - name: nginex
      image: nginx:alpine
```

Si nuestros Pods estan etiquetados podremos filtrarlos con el siguiente comando:

````shell
kubectl get pods -l <LABEL_NAME>=<LABEL_VALUE>
kubectl get pods -l <LABEL_NAME>=<LABEL_VALUE>,<LABEL_NAME>=<LABEL_VALUE>
```