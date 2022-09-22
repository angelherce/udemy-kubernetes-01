package main

import ( "net/http" )

func ServeHTTP( w http.ResponseWriter, r *http.Request) {
    w.WriteHeader( http.StatusOK )
    w.Header().Set("Content-Type", "application/json")
    w.Write([]byte(`{"message": "hello world"}`))
}

func main(){
    http.HandleFunc("/", ServeHTTP)
    http.ListenAndServe(":9090", nil)
}