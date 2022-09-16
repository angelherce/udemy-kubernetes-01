# Instalación de Minikube - ¡Un cluster local, poderoso y muy fácil de usar !

1. Instalar Docker [[DOC]](https://docs.docker.com/engine/install/)  

2. Eliminar el uso de `sudo` en los comandos de Docker en Ubuntu _(Opcional)_.  

    1. Se tiene que agregar su nombre de usuario al grupo `docker`. Si se tiene que agregar al grupo `docker` un usuario con el que no inició sesión, declare dicho nombre de usuario de forma explícita en vez de utilizar `${USER}`:

    ```bash
    sudo usermod -aG docker ${USER}
    ```

    2. Aplicar los cambios del nuevo miembro que se ha añadido al grupo.

    ```bash
    su - ${USER}
    ```

    3. Confirmamos que se ha añadido el usuario al grupo de `docker`.
    ```bash
    id -nG
    ```


3. Instalar Docker Compose
    - Plugin [[DOC]](https://docs.docker.com/compose/install/)
    - docker-compose
        1. El siguiente comando descargará la versión `1.29.2` y guardará el archivo ejecutable en `/usr/local/bin/docker-compose`, lo que hará que este software sea accesible globalmente como `docker-compose`.

        ```bash
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        ```

        2. Establecer los permisos correctos para que el comando `docker-compose` sea ejecutable.

        ```bash
        sudo chmod +x /usr/local/bin/docker-compose
        ```

        3. Comprobamos que se ha instalado correctamente ejecutando el siguiente comando:

        ```bash
        docker-compose --version
        ```

4. Instalar Kubectl [[DOC]](https://kubernetes.io/docs/tasks/tools/)

5. Instalar Minikube [[DOC]](https://minikube.sigs.k8s.io/docs/start/)