> _**Sección 17:** Kubernetes Volumes - Entiende los conceptos detrás de la persistencia de datos_

# Video 122 - ¿Qué es un Volumen?

## 1- _Teoría_

Los archivos localizados dentro de un contenedor son efímeros, lo cual presenta problemas para aplicaciones no triviales cuando se ejecutan en contenedores. Un problema es la pérdida de archivos cuando el contenedor termina. Kubelet reinicia el contenedor con un estado limpio. Un segundo problema ocurre cuando compartimos ficheros entre contenedores corriendo juntos dentro de un Pod. La abstracción volume de Kubernetes resuelve ambos problemas.

[source](https://kubernetes.io/es/docs/concepts/storage/volumes/)

### 1- _EmptyDir Volume_

Un volumen `emptyDire` creado primero cuando se asigna un Pod a un nodo, y existe mientras el Pod está corriendo en el nodo. Como su nombre lo indica un volumen `emptydir` está inicialmente vacío. Todos los contenedores en el Pod pueden leer y escribir los archivos en el volumen `emptyDir`, aunque ese volumen se puede montar en la misma o diferente ruta en cada contenedor. Cuando un Pod es removido del nodo por alguna razón, los datos en emptydir se borran permanentemente.

Algunos usos para un `emptyDir` son:

- Espacio temporal, como para una clasificación de combinación basada en disco
- Marcar un largo cálculo para la recuperación de fallos
- Contener archivos que un contenedor de administrador de contenido recupera mientras un contenedor de servidor web sirve los datos

[source](https://kubernetes.io/es/docs/concepts/storage/volumes/#emptydir)

### 2- _HostPaht Volume_

Un volumen `hostPath` monta un archivo o un directorio del sistema de archivos del nodo host a tu Pod. Esto no es algo de muchos Pods necesiten, pero ofrece una trampa de escape poderosa para algunas aplicaciones.

Por ejemplo, algunos usos de un `hostPath` son:

- Ejecutar un contenedor que necesita acceso a los directorios internos de Docker, usa un `hostPath` de `/var/lib/docker`
- Ejecutar un cAdvisor en un contenedor; usa un hostPath de `/sys`
- Permitir a un Pod especificar si un `hostPath` dado debería existir ante de correr el Pod, si debe crearse, cómo debe existir

[source](https://kubernetes.io/es/docs/concepts/storage/volumes/#hostpath)


### 3- _Volúmenes Persistentes (PVC & PV)_

La gestión del almacenamiento es un problema distinto de la gestión de instancias informáticas. El subsistema PersistentVolume proporciona una API para usuarios y administradores que abstrae los detalles de cómo se proporciona el almacenamiento a partir de cómo se consume. Para hacer esto, presentamos dos nuevos recursos de API: PersistentVolume y PersistentVolumeClaim.

Un PersistentVolume (PV) es una pieza de almacenamiento en el clúster que ha sido aprovisionada por un administrador o aprovisionada dinámicamente mediante clases de almacenamiento . Es un recurso en el clúster al igual que un nodo es un recurso de clúster. Los PV son complementos de volumen como Volúmenes, pero tienen un ciclo de vida independiente de cualquier Pod individual que use el PV. Este objeto API captura los detalles de la implementación del almacenamiento, ya sea NFS, iSCSI o un sistema de almacenamiento específico del proveedor de la nube.

Un PersistentVolumeClaim (PVC) es una solicitud de almacenamiento por parte de un usuario. Es similar a un Pod. Los pods consumen recursos de nodos y los PVC consumen recursos de PV. Los pods pueden solicitar niveles específicos de recursos (CPU y memoria). Las notificaciones pueden solicitar modos de acceso y tamaños específicos (p. ej., se pueden montar ReadWriteOnce, ReadOnlyMany o ReadWriteMany, consulte Modos de acceso ).

Si bien PersistentVolumeClaims permite a un usuario consumir recursos de almacenamiento abstractos, es común que los usuarios necesiten PersistentVolumes con diferentes propiedades, como el rendimiento, para diferentes problemas. Los administradores de clústeres deben poder ofrecer una variedad de PersistentVolumes que difieran en más aspectos que el tamaño y los modos de acceso, sin exponer a los usuarios a los detalles de cómo se implementan esos volúmenes. Para estas necesidades, existe el recurso StorageClass .

[source](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

### 4- _Reclaim Policy_

Cuando un usuario termina con su volumen, puede eliminar los objetos de PVC de la API que permite la recuperación del recurso. La política de reclamación de un `PersistentVolume` le dice al clúster qué hacer con el volumen después de que se haya liberado de su reclamación. Actualmente, los volúmenes se pueden retener, reciclar o eliminar.

[source](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#reclaiming)