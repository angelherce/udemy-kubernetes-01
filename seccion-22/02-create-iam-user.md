# Crear un usuario IAM para crear recursos en AWS

**01- _Nos dirigimos a la página de inicio de la consola de AWS_**  
[https://us-east-1.console.aws.amazon.com/console/home](https://us-east-1.console.aws.amazon.com/console/home)

---

**02- _Nos dirigimos al panel de IAM_**  
_En la barra superior de búsqueda escribimos iam y presionamos enter._  

![01.png](D:\code\udemy\kubernetes\seccion-22\img\177\01.png)

---

**03- _Nos dirigimos a la sección de Usuarios_**  
_En el menu lateral izquierdo pulsamos en la opción de `Usuarios`._  

![02.png](D:\code\udemy\kubernetes\seccion-22\img\177\02.png)

---

**04- _Creamos un nuevo usuario_**  
_Pulsamos en el botón `Agregar Usuarios`._  

![03.png](D:\code\udemy\kubernetes\seccion-22\img\177\03.png)

---

**05- _Establecemos los detalles del Usuario y el tipo de acceso de AWS_**  
_Establecemos un nombre de usuario, marcamos el check `Clave de acceso: acceso mediante programación` y pulsamos el botón `Siguiente: Permisos`._  

![04.png](D:\code\udemy\kubernetes\seccion-22\img\177\04.png)

---

**06- _Establecemos los permisos del Usuario_**  
_Pulsamos en `Asociar directamente las políticas existentes`, marcamos el check de la política `AdministrationAccess` y pulsamos el botón `Siguiente: Etiquetas`._

![05.png](D:\code\udemy\kubernetes\seccion-22\img\177\05.png)

---

**07- _No añadimos ninguna etiqueta al Usuario_**  
_Pulsamos el botón `Siguiente: Revisar`._

![06.png](D:\code\udemy\kubernetes\seccion-22\img\177\06.png)

---

**08- _Revisamos la información del Usuario que vamos a crear_**  
_Pulsamos el botón `Crear un usuario`._

![07.png](D:\code\udemy\kubernetes\seccion-22\img\177\07.png)

---

**09- _Finalmente, se ha creado el usuario IAM_**    
_Necesitaremos guardar el `ID de clave de acceso` y la `Clave de acceso secreta`_  

![08.png](D:\code\udemy\kubernetes\seccion-22\img\177\08.png)

---

**10- _Nos dirigimos al panel de EC2 para establecer la región_**  
_En la barra superior de búsqueda escribimos ec2 y presionamos enter._

![01.png](D:\code\udemy\kubernetes\seccion-22\img\177\01.png)

---

**11- _Abrimos el desplegable de la región_**  
_En la barra superior de búsqueda podemos abrir el desplegable de la región pulsando en esta._

![09.png](D:\code\udemy\kubernetes\seccion-22\img\177\09.png)

---

**12- _Por último, establecemos como región el "Norte de Virginia" `us-east-1`_**  

![10.png](D:\code\udemy\kubernetes\seccion-22\img\177\10.png)