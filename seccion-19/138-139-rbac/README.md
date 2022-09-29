> _**Sección 19:** Role Based Access Control: Users & Groups_

# Video [138-139] - Roles vs ClusterRoles

## 1- _Teoría_

El control de acceso basado en funciones (RBAC) es un método para regular el acceso a recursos informáticos o de red en función de las funciones de los usuarios individuales dentro de su organización.

[source](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

### 1.1- _Roles & ClusterRoles_

Una función RBAC o ClusterRole contiene reglas que representan un conjunto de permisos. Los permisos son puramente aditivos (no hay reglas de "denegación").

Un rol siempre establece permisos dentro de un determinado namespace; cuando crea un rol, debe especificar el namespace al que pertenece.

ClusterRole, por el contrario, es un recurso sin namespace. Los recursos tienen nombres diferentes (Role y ClusterRole) porque un objeto de Kubernetes siempre tiene que tener un namespace o no tenerlo; no pueden ser ambos.

ClusterRoles tiene varios usos. Puede usar un ClusterRole para:

- Definir permisos en recursos de namespaces y obtener acceso dentro de namespaces individuales.
- Definir permisos en recursos de namespaces y obtener acceso en todos los namespaces.
- Definir permisos en recursos del ámbito del clúster.

  Si desea definir un rol dentro de un namespace, use un Rol; si desea definir un rol en todo el clúster, use un ClusterRole.
  
[source](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#role-and-clusterrole)
