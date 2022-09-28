> _**Sección 15:** ConfigMaps & Environment Variables - Inyecta datos en tus Pods_

# Video 104 - Crea tu primera variable de entorno

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
        - name: 'VAR1'
          value: 'test1'
        - name: 'VAR2'
          value: 'test2'
        - name: 'VAR3'
          value: 'test3'
```