> _**Sección 21:** Ingress: Aprende a exponer tus aplicaciones fuera del Clúster_

# Video 174 - Modifica las reglas de Ingress para ganar familiaridad

## 1- _Teoría_

Ingress expone las rutas HTTP y HTTPS desde fuera del clúster a los servicios dentro del clúster. El enrutamiento del tráfico está controlado por reglas definidas en el recurso Ingress.

Se puede configurar un Ingress para brindar servicios de direcciones URL accesibles externamente, equilibrar la carga del tráfico, finalizar SSL/TLS y ofrecer alojamiento virtual basado en el nombre. Un controlador de Ingress es responsable de cumplir con el Ingress, generalmente con un balanceador de carga, aunque también puede configurar su enrutador perimetral o interfaces adicionales para ayudar a manejar el tráfico.

Ingress no expone puertos o protocolos arbitrarios. La exposición de servicios distintos de HTTP y HTTPS a Internet suele utilizar un servicio de tipo `Service.Type=NodePort` o `Service.Type=LoadBalancer`.

[source](https://kubernetes.io/docs/concepts/services-networking/ingress/)

### 1.1- _Intallation_
 
[source](https://kubernetes.github.io/ingress-nginx/deploy/)

## 2- _YAML_

> Para Minikube hay que lanzar este comando para habilitar el ingress controller de nginx.  
> 
> `minikube addons enable ingress`

**nginx-controller**

[https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml](https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml)

**app-v1**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-v1-deploy
  labels:
    app: app-v1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: app-v1
  template:
    metadata:
      labels:
        app: app-v1
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
          command: ['sh', '-c', 'echo "<h1>APP V1</h1><p>VERSION 1.0 desde $HOSTNAME</p>" > /usr/share/nginx/html/index.html && nginx -g "daemon off;"']
---
apiVersion: v1
kind: Service
metadata:
  name: app-v1-svc
  labels:
    app: app-v1
spec:
  type: NodePort
  selector:
    app: app-v1
  ports:
    - name: http
      port: 8080
      targetPort: 80
      protocol: TCP
```

---

**app-v2**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-v2-deploy
  labels:
    app: app-v2
spec:
  replicas: 3
  selector:
    matchLabels:
      app: app-v2
  template:
    metadata:
      labels:
        app: app-v2
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
          command: ['sh', '-c', 'echo "<h1>APP V2</h1><p>VERSION 1.0 desde $HOSTNAME</p>" > /usr/share/nginx/html/index.html && nginx -g "daemon off;"']
---
apiVersion: v1
kind: Service
metadata:
  name: app-v2-svc
  labels:
    app: app-v2
spec:
  type: NodePort
  selector:
    app: app-v2
  ports:
    - name: http
      port: 9090
      targetPort: 80
      protocol: TCP
```

---

**ingress**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - host: app.org
      http:
        paths:
          # APP V1
          - path: /v1
            pathType: Prefix
            backend:
              service:
                name: app-v1-svc
                port:
                  number: 8080

          # APP V2
          - path: /v2
            pathType: Prefix
            backend:
              service:
                name: app-v2-svc
                port:
                  number: 9090
```