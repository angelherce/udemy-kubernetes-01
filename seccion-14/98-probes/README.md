> _**Sección 14:** Health Checks & Probes - Vigila el estado de tus contenedores_

# Video 98 - ¿Qué son los Probes y cómo se ejecutan?

El kubelet usa pruebas de actividad para saber cuándo reiniciar un contenedor. Por ejemplo, las sondas de actividad podrían detectar un interbloqueo, donde una aplicación se está ejecutando, pero no puede avanzar. Reiniciar un contenedor en ese estado puede ayudar a que la aplicación esté más disponible a pesar de los errores.

El kubelet usa sondeos de preparación para saber cuándo un contenedor está listo para comenzar a aceptar tráfico. Un Pod se considera listo cuando todos sus contenedores están listos. Un uso de esta señal es controlar qué Pods se utilizan como backends para los Servicios. Cuando un pod no está listo, se elimina de los balanceadores de carga del servicio.

El kubelet usa sondas de inicio para saber cuándo se ha iniciado una aplicación de contenedor. Si se configura una sonda de este tipo, deshabilita las comprobaciones de actividad y preparación hasta que tenga éxito, asegurándose de que esas sondas no interfieran con el inicio de la aplicación. Esto se puede usar para adoptar controles de actividad en contenedores de inicio lento, evitando que el kubelet los elimine antes de que estén en funcionamiento.

[source](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)