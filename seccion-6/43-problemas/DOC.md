> _**Sección 6:** ReplicaSets - Aprende a garantizar réplicas en tus Pods_

# Video 43 - Problemas de ReplicaSet

- Si cambiamos algo en los Pods del ReplicaSet, como por ejemplo la versión de la imagen de un contenedor del Pods, el ReplicaSet no hará nada por que éste sólo se encarga de mantener en pie unos determinados Pods según su label y no su contenido. Por tanto el ReplicaSet es incapaz de actualizar los Pods.