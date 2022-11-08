# Configuración

**01- _Instalamos AWS CLI_**  
```shell
sudo apt install awscli
```

---

**02- _Comprobamos que se ha instalado AWS CLI_**  
```shell
aws --version
```

---

**03- _Nos dirigimos a la página de inicio de la consola de AWS_**  
[https://us-east-1.console.aws.amazon.com/console/home](https://us-east-1.console.aws.amazon.com/console/home)

---

**04- _Nos dirigimos al panel de IAM_**  
_En la barra superior de búsqueda escribimos iam y presionamos enter._  

![01.png](D:\code\udemy\kubernetes\seccion-22\img\177\01.png)

---

**05- _Nos dirigimos a la sección de Usuarios_**  
_En el menu lateral izquierdo pulsamos en la opción de `Usuarios`._  

![02.png](D:\code\udemy\kubernetes\seccion-22\img\177\02.png)

---

**06- _Creamos un nuevo usuario_**  
_Pulsamos en el botón `Agregar Usuarios`._  

![03.png](D:\code\udemy\kubernetes\seccion-22\img\177\03.png)

---

**07- _Establecemos los detalles del Usuario y el tipo de acceso de AWS_**  
_Establecemos un nombre de usuario, marcamos el check `Clave de acceso: acceso mediante programación` y pulsamos el botón `Siguiente: Permisos`._  

![04.png](D:\code\udemy\kubernetes\seccion-22\img\177\04.png)

---

**08- _Establecemos los permisos del Usuario_**  
_Pulsamos en `Asociar directamente las políticas existentes`, marcamos el check de la política `AdministrationAccess` y pulsamos el botón `Siguiente: Etiquetas`._

![05.png](D:\code\udemy\kubernetes\seccion-22\img\177\05.png)

---

**09- _No añadimos ninguna etiqueta al Usuario_**  
_Pulsamos el botón `Siguiente: Revisar`._

![06.png](D:\code\udemy\kubernetes\seccion-22\img\177\06.png)

---

**10- _Revisamos la información del Usuario que vamos a crear_**  
_Pulsamos el botón `Crear un usuario`._

![07.png](D:\code\udemy\kubernetes\seccion-22\img\177\07.png)

---

**11- _Finalmente, se ha creado el usuario IAM_**    
_Necesitaremos guardar el `ID de clave de acceso` y la `Clave de acceso secreta`_  

![08.png](D:\code\udemy\kubernetes\seccion-22\img\177\08.png)

---

**12- _Nos dirigimos al panel de EC2 para establecer la región_**  
_En la barra superior de búsqueda escribimos ec2 y presionamos enter._

![01.png](D:\code\udemy\kubernetes\seccion-22\img\177\01.png)

---

**13- _Abrimos el desplegable de la región_**  
_En la barra superior de búsqueda podemos abrir el desplegable de la región pulsando en esta._

![09.png](D:\code\udemy\kubernetes\seccion-22\img\177\09.png)

---

**14- _Establecemos como región el "Norte de Virginia" `us-east-1`_**  

![10.png](D:\code\udemy\kubernetes\seccion-22\img\177\10.png)

---

**15- _Configuramos el usuario IAM en AWS CLI_**  

```shell
aws configure
```

> _**1-** Establecemos el `AWS Access Key ID`_  
> _**2-** Establecemos el `AWS Secret Access Key`_  
> _**3-** Establecemos el `Default region name` (us-east-1)_  
> _**4-** Establecemos el `Default output format` en none_

---

**16- _Comprobamos que se ha guardado la información y la configuración del usuario IAM en AWS CLI_**  

```shell
ls /home/indenaiten/.aws
```

```shell
cat /home/indenaiten/.aws/credentials
```

```shell
cat /home/indenaiten/.aws/config
```

```shell
aws sts get-caller-identity
```

---

**17- _Instalamos la herramienta de EKS_**  

[https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)  

> _Instalación en **Ubuntu 22.04.2**_  

_1- Descargamos y extraemos la última versión de eksctl con el siguiente comando._

```shell
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
``` 

_2- Movemos el binario extraído a `/usr/local/bin`._

```shell
sudo mv /tmp/eksctl /usr/local/bin
```

_3- Comprobamos que la instalación fue exitosa con el siguiente comando._

```shell
eksctl version
```