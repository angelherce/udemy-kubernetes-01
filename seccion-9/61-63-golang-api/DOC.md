> _**Sección 9:** Golang, JavaSCript y Kubernetes - Aprende a construir aplicaciones reales_

# Video [61-63] - Golang: Empieza a escribir tu API

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
    w.Write(response)
}

func main(){
    http.HandleFunc("/", ServeHTTP)
    http.ListenAndServe(":9090", nil)
}
```

### 1.2- Backend - Dockerfile