> _**Sección 17:** Kubernetes Volumes - Entiende los conceptos detrás de la persistencia de datos_

# Video 122 - ¿Qué es un Volumen?

Los archivos localizados dentro de un contenedor son efímeros, lo cual presenta problemas para aplicaciones no triviales cuando se ejecutan en contenedores. Un problema es la pérdida de archivos cuando el contenedor termina. Kubelet reinicia el contenedor con un estado limpio. Un segundo problema ocurre cuando compartimos ficheros entre contenedores corriendo juntos dentro de un Pod. La abstracción volume de Kubernetes resuelve ambos problemas.

- **[EmptyDir Volume](https://kubernetes.io/es/docs/concepts/storage/volumes/#emptydir)**

  Un volumen `emptyDire` creado primero cuando se asigna un Pod a un nodo, y existe mientras el Pod está corriendo en el nodo. Como su nombre lo indica un volumen `emptydir` está inicialmente vacío. Todos los contenedores en el Pod pueden leer y escribir los archivos en el volumen `emptyDir`, aunque ese volumen se puede montar en la misma o diferente ruta en cada contenedor. Cuando un Pod es removido del nodo por alguna razón, los datos en emptydir se borran permanentemente.

  Algunos usos para un `emptyDir` son:

    - Espacio temporal, como para una clasificación de combinación basada en disco
    - Marcar un largo cálculo para la recuperación de fallos
    - Contener archivos que un contenedor de administrador de contenido recupera mientras un contenedor de servidor web sirve los datos

    
- **[HostPaht Volume](https://kubernetes.io/es/docs/concepts/storage/volumes/#hostpath)**

  Un volumen `hostPath` monta un archivo o un directorio del sistema de archivos del nodo host a tu Pod. Esto no es algo de muchos Pods necesiten, pero ofrece una trampa de escape poderosa para algunas aplicaciones.

  Por ejemplo, algunos usos de un `hostPath` son:

  - Ejecutar un contenedor que necesita acceso a los directorios internos de Docker, usa un `hostPath` de `/var/lib/docker`
  - Ejecutar un cAdvisor en un contenedor; usa un hostPath de `/sys`
  - Permitir a un Pod especificar si un `hostPath` dado debería existir ante de correr el Pod, si debe crearse, cómo debe existir
  

  [source](https://kubernetes.io/es/docs/concepts/storage/volumes/)