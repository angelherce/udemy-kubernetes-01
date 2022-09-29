# Creamos llave SSL
openssl genrsa -out ./k8s/rbac/cert/angelhs.key 2048

# Creamos el CSR con la llave SSL
openssl req -new -key ./k8s/rbac/cert/angelhs.key \
  -out ./k8s/rbac/cert/angelhs.csr -subj "/CN=angelhs/O=dev"

# Obtenemos la ruta de ca.crt del cluster
kubectl config view | grep -i certificate-auth

# Firmamos nuestro csr con el ca.crt y el ca.key para generar nuestro crt
sudo openssl x509 -req -in ./k8s/rbac/cert/angelhs.csr \
  -CA <FOLDER>ca.crt \
  -CAkey <FOLDER>ca.key \
  -CAcreateserial -out ./k8s/rbac/cert/angelhs.crt \
  -days 500

# Validamos el CN y el organization
openssl x509 -in ./k8s/rbac/cert/angelhs.crt -noout -text | grep -i subject:
openssl x509 -in ./k8s/rbac/cert/angelhs.crt -noout -text | grep -i issuer: