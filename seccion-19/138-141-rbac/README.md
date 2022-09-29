> _**Sección 19:** Role Based Access Control: Users & Groups_

# Video [138-141] - Roles vs ClusterRoles

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

### 1.2- _RoleBinding & ClusterRoleBinding_

Un enlace de rol otorga los permisos definidos en un rol a un usuario o conjunto de usuarios. Contiene una lista de sujetos (usuarios, grupos o cuentas de servicio) y una referencia al rol que se otorga. Un RoleBinding otorga permisos dentro de un namespace específico, mientras que un ClusterRoleBinding otorga ese acceso a todo el clúster.

Un RoleBinding puede hacer referencia a cualquier rol en el mismo namespace. Alternativamente, un RoleBinding puede hacer referencia a un ClusterRole y vincular ese ClusterRole al namespace del RoleBinding. Si desea vincular un ClusterRole a todos los namespaces en su clúster, use un ClusterRoleBinding.

[source](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#rolebinding-and-clusterrolebinding)

### 1.3- _Users & Groups_

Todos los clústeres de Kubernetes tienen dos categorías de usuarios: cuentas de servicio administradas por Kubernetes y usuarios normales.

Se supone que un servicio independiente del clúster administra a los usuarios normales de las siguientes maneras:

- Un administrador distribuyendo claves privadas.
- Una tienda de usuarios como Keystone o Google Accounts.
- Un archivo con una lista de nombres de usuario y contraseñas.
- 
En este sentido, Kubernetes no tiene objetos que representen cuentas de usuario normales. Los usuarios normales no se pueden agregar a un clúster a través de una llamada a la API.

Aunque no se puede agregar un usuario normal a través de una llamada API, cualquier usuario que presente un certificado válido firmado por la autoridad de certificación (CA) del clúster se considera autenticado. En esta configuración, Kubernetes determina el nombre de usuario a partir del campo de nombre común en el `subject` del certificado (p. ej., "/CN=bob"). A partir de ahí, el subsistema de control de acceso basado en roles (RBAC) determinaría si el usuario está autorizado para realizar una operación específica en un recurso. Para obtener más detalles, consulte el tema de usuarios normales en la solicitud de certificado para obtener más detalles al respecto.

Por el contrario, las cuentas de servicio son usuarios administrados por la API de Kubernetes. Están vinculados a namespaces específicos y son creados automáticamente por la API o manualmente a través de llamadas API. Las cuentas de servicio están vinculadas a un conjunto de credenciales almacenadas como `Secrets`, que se montan en pods, lo que permite que los procesos del clúster se comuniquen con la API de Kubernetes.

Las solicitudes de API están vinculadas a un usuario normal o a una cuenta de servicio, o se tratan como solicitudes anónimas.

[source](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#users-in-kubernetes)
