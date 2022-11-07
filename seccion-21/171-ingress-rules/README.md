> _**Sección 21:** Ingress: Aprende a exponer tus aplicaciones fuera del Clúster_

# Video 171 - Crea reglas en el Ingress para exponer tu app

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

**deployment**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ingress-deploy
  labels:
    app: ingress-proof
spec:
  replicas: 3
  selector:
    matchLabels:
      app: ingress-proof
  template:
    metadata:
      labels:
        app: ingress-proof
    spec:
      containers:
        - name: nginx
          image: nginx:alpine
          command: ['sh', '-c', 'echo VERSION 1.0 desde $HOSTNAME > /usr/share/nginx/html/index.html && nginx -g "daemon off;"']
```

---

**service**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: ingress-svc
  labels:
    app: ingress-proof
spec:
  type: ClusterIP
  selector:
    app: ingress-proof
  ports:
    - name: http
      port: 8080
      targetPort: 80
      protocol: TCP
```

---

**ingress**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-test
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - http:
        paths:
          - path: /app
            pathType: Prefix
            backend:
              service:
                name: ingress-svc
                port:
                  number: 8080
```