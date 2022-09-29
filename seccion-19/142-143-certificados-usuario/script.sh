# Creamos llave SSL
openssl genrsa -out ./k8s/rbac/cert/angelhs.key 2048

# Creamos el CSR con la llave SSL
openssl req -new -key ./k8s/rbac/cert/angelhs.key \
  -out ./k8s/rbac/cert/angelhs.csr -subj "/CN=angelhs/O=dev"

# Obtenemos la ruta de ca.crt del cluster
kubectl config view | grep -i certificate-auth

# Firmamos nuestro csr con el ca.crt y el ca.key para generar nuestro crt
sudo openssl x509 -req -in ./k8s/rbac/cert/angelhs.csr \
  -CA <FOLDER><CA_CRT_NAME>.crt \
  -CAkey <FOLDER><CA_KEY_NAME>.key \
  -CAcreateserial -out ./k8s/rbac/cert/angelhs.crt \
  -days 500

# Validamos el CN y el organization
openssl x509 -in ./k8s/rbac/cert/angelhs.crt -noout -text | grep -i subject:
openssl x509 -in ./k8s/rbac/cert/angelhs.crt -noout -text | grep -i issuer:

# Ver mi usuario de Kubernetes
kubectl config current-context

# Creamos un contenedor de docker para realizar la prueba de autenticación con nuestro certificado
kubectl config view | grep server
sudo docker run --rm -it -v $PWD:/test -w /test -v <FOLDER><CA_CRT_NAME>.crt:/ca.crt --network host alpine sh
apk add -U curl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Configuramos kubectl en el contenedor
kubectl config set-cluster minikube --server=https://192.168.49.2:8443 --certificate-authority=/ca.crt
kubectl config view | grep -i cluster: -A 2
kubectl config set-credentials angelhs --client-certificate=./k8s/rbac/cert/angelhs.crt --client-key=./k8s/rbac/cert/angelhs.key
kubectl config view | grep -i users: -A 5
kubectl config set-context angelhs --cluster=minikube --user=angelhs
kubectl config use-context angelhs
kubectl config view | grep -i current-context: -m 1