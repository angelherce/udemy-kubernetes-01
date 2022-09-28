> _**Sección 15:** ConfigMaps & Environment Variables - Inyecta datos en tus Pods_

# Video 105 - Captura valores embebidos al Pod por medio de variables de entorno

## 1- _YAML_

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: podtest
spec:
  containers:
    - name: nginx
      image: nginx:alpine
      env:
        - name: 'MY_NODE_NAME'
          valueFrom:
            fieldRef:
              fieldPath: 'spec.nodeName'
        - name: 'MY_POD_NAME'
          valueFrom:
            fieldRef:
              fieldPath: 'metadata.name'
        - name: 'MY_POD_NAMESPACE'
          valueFrom:
            fieldRef:
              fieldPath: 'metadata.namespace'
        - name: 'MY_POD_IP'
          valueFrom:
            fieldRef:
              fieldPath: 'status.podIP'

```