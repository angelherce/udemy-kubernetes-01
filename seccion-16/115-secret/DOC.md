> _**Sección 16:** Secrets - Aprende a manejar data sensible en Kubernetes_

# Video 115 - ¿Qué es un Secret?

Un Secret es un objeto que contiene una pequeña cantidad de datos confidenciales como contraseñas, un token, o una llave. Tal información podría ser puesta en la especificación de un Pod o en una imagen; poniendolo en un objeto de tipo Secret permite mayor control sobre como se usa, y reduce el riesgo de exposicición accidental.

Los usuarios pueden crear Secrets, y el sistema también puede crearlos.

Para usar un Secret, un Pod debe hacer referencia a este. Un Secret puede ser usado con un Pod de dos formas: como archivos en un volume montado en uno o más de sus contenedores, o utilizados por el kubelet al extraer imágenes del pod.

[source](https://kubernetes.io/es/docs/concepts/configuration/secret/)