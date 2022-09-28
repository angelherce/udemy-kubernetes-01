> _**Sección 6:** ReplicaSets - Aprende a garantizar réplicas en tus Pods_

# Video 42 - Adopción de Pods desde ReplicaSet - ¡Evitar usar Pods planos!

Si creamos un Pod con un label, y luego creamos un ReplicaSet que selecciones los Pods con el mismo label que hemos especificado en el Pod que creamos, el ReplicaSet adoptará este Pod indiferentemente de los contenedores que tenga. Por eso no debemos crear Pods directamente.