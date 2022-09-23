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