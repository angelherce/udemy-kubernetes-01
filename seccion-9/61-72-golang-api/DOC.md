> _**Sección 9:** Golang, JavaSCript y Kubernetes - Aprende a construir aplicaciones reales_

# Video [61-72] - Golang: Empieza a escribir tu API

[DOC:](https://pkg.go.dev/net/http) GOLANG - Package `net/http`
[DOC:](https://www.digitalocean.com/community/tutorials/how-to-make-an-http-server-in-go) Digitalocear - HTTP Server

## 1 - Backend

### 1.1- Backend - GOLANG HTTP Server

```go
package main

import (
    "encoding/json"
    "net/http"
    "os"
    "time"
)

type HandsOn struct{
    Time time.Time `json:"time"`
    Hostname string `json:"hostname"`
}

func ServeHTTP( w http.ResponseWriter, r *http.Request) {
    if r.URL.Path != "/" {
        http.NotFound(w, r)
        return
    }

    info := HandsOn{
        Time: time.Now(),
        Hostname: os.Getenv("HOSTNAME"),
    }

    response, err := json.Marshal(&info)

    if err != nil {
        w.Write([]byte("Error"))
        return
    }

    w.WriteHeader( http.StatusOK )
    w.Header().Set("Content-Type", "application/json")
    w.Header().Set("Access-Control-Allow-Origin", "*")
    w.Write(response)
}

func main(){
    http.HandleFunc("/", ServeHTTP)
    http.ListenAndServe(":9090", nil)
}
```

### 1.2- Backend - Dockerfile

```plaintext
FROM golang:1.13 AS builder
WORKDIR /app
COPY ./src/main.go ./
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://proxy.golang.org go build -o app ./main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app ./
ENTRYPOINT ["./app"]
```

### 1.3- Backend- Deployment & Service

1. Primero debemos crear la nuestra imágen de Docker a partir del Dockerfile

```shell
docker build -t <IMAGE_NAME> -f <DOCKERFILE_PATH> <CONTEXT_PATH>
```

2. Si estamos utilizando minikube en WSL, cargaremos la imágen creada en minikube

```shell
minikube image load <IMAGE_DOCKER_NAME>:<IMAGE_DOCKER_TAG>
```

3. A continuación creamos el Manifiesto para Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: golang-app-server
  labels:
    app: golang-app
    app-type: backend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: golang-app
      app-type: backend
  template:
    metadata:
      labels:
        app: golang-app
        app-type: backend
    spec:
      containers:
        - name: backend
          # Por defecto Kubernetes va a buscar la imágen en internet
          imagePullPolicy: IfNotPresent
          image: golang-app-server:v1
---
apiVersion: v1
kind: Service
metadata:
  name: golang-app-server
  labels:
    app: golang-app
    app-type: backend
spec:
  type: NodePort
  selector:
    app: golang-app
    app-type: backend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

4. Si estas utilizando WSL y minikube, para poder acceder al servicio desde tu máquina local tendrémos que habilitar el servicio en minikube:

```shell
minikube service <SERVICE_KUBERNETES_NAME>
```

## 2 - Frontend

### 2.1 - Fichero HTML

> **NOTA:** _El fetch no funciona por que el DNS al que intenta acceder sólo es visible desde el clúster, el cliente ejecuta este código desde su navegador y por eso no funciona._
> **SOLUCIÓN:** _Cambiaremos el Service de nuestro backend a tipo `NodePort`_

```html
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

        <title>Document</title>

        <script>
            window.addEventListener( "load", function(){
                fetch( 'http://golang-app:80/' )
                .then( response => response.json() )
                .then( data => {
                    document.querySelector( '.data span.hostname' ).innerHTML = data.hostname;
                    document.querySelector( '.data span.time' ).innerHTML = data.time;
                })
                .catch( error => console.log( error ));
            });
        </script>
    </head>

    <body>
        <h1>Frontend</h1>
        <div class="data">
            <p>Hotname: <span class="hostname"></span></p>
            <p>Time: <span class="time"></span></p>
        </div>
    </body>
</html>
```

### 2.2- Frontend - Dockerfile

```plaintext
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY ./src ./
```

### 2.3- Frontend- Deployment & Service

1. Primero debemos crear la nuestra imágen de Docker a partir del Dockerfile

```shell
docker build -t <IMAGE_NAME> -f <DOCKERFILE_PATH> <CONTEXT_PATH>
```

2. Si estamos utilizando minikube en WSL, cargaremos la imágen creada en minikube

```shell
minikube image load <IMAGE_DOCKER_NAME>:<IMAGE_DOCKER_TAG>
```

3. A continuación creamos el Manifiesto para Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: golang-app-client
  labels:
    app: golang-app
    app-type: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: golang-app
      app-type: frontend
  template:
    metadata:
      labels:
        app: golang-app
        app-type: frontend
    spec:
      containers:
        - name: frontend
          # Por defecto Kubernetes va a buscar la imágen en internet
          imagePullPolicy: IfNotPresent
          image: golang-app-client:v1
---
apiVersion: v1
kind: Service
metadata:
  name: golang-app-client
  labels:
    app: golang-app
    app-type: frontend
spec:
  type: NodePort
  selector:
    app: golang-app
    app-type: frontend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```