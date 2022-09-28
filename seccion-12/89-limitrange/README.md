> _**Sección 12:** LimitRange - Aprende a controlar el uso de recursos a nivel de objetos_

# Video 89 - ¿Qué es un LimitRange?

Por defecto, los contenedores se ejecutan sin restricciones sobre los recursos informáticos disponibles en un clúster de Kubernetes. Si el Nodo dispone de los recursos informáticos, un Pod o sus Contenedores tienen permitido consumir por encima de la cuota solicitada si no superan el límite establecido en su especificación. Existe la preocupación de que un Pod o Contenedor pueda monopolizar todos los recursos disponibles.  

Un LimitRange es la política que permite:

- Imponer restricciones de requisitos de recursos a Pods o Contenedores por Namespace.

- Imponer las limitaciones de recursos mínimas/máximas para Pods o Contenedores dentro de un Namespace.

- Especificar requisitos y límites de recursos predeterminados para Pods o Contenedores de un Namespace.

- Imponer una relación de proporción entre los requisitos y el límite de un recurso.

- Imponer el cumplimiento de las demandas de almacenamiento mínimo/máximo para Solicitudes de Volúmenes Persistentes.

[source](https://kubernetes.io/es/docs/concepts/policy/limit-range/)