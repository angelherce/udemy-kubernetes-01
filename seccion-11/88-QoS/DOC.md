> _**Sección 11:** Limita la Ram y la CPU que pueden usar tus pods_

# Video 88 - QoS Classes

Quality of Service o QoS se refiere a las herramientas que se encargan del uso de diferentes tecnologías o mecanismos que tienen la capacidad de controlar el tráfico y asegurar el rendimiento de aplicaciones críticas que tengan una red limitada.

- **Guaranteed**
  - _Cada Contenedor en el Pod debe tener un límite de memoria y una solicitud de memoria._
  - _Para cada Contenedor en el Pod, el límite de memoria debe ser igual a la solicitud de memoria._
  - _Cada Contenedor en el Pod debe tener un límite de CPU y una solicitud de CPU._
  - _Para cada Contenedor en el Pod, el límite de CPU debe ser igual a la solicitud de CPU._

- **Burstable**
  - _El Pod no cumple con los criterios de la clase QoS garantizada._
  - _Al menos un Contenedor en el Pod tiene una solicitud o límite de memoria o CPU._

- **BestEffort**
  - _Los contenedores en el pod no deben tener ningún límite o solicitud de memoria o CPU._

[source](https://kubernetes.io/docs/tasks/configure-pod-container/quality-service-pod/)