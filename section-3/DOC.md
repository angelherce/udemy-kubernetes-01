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


3. Instalar Docker Compose [[DOC]](https://docs.docker.com/compose/install/)

4. Instalar Kubectl [[DOC]](https://kubernetes.io/docs/tasks/tools/)

5. Instalar Minikube [[DOC]](https://minikube.sigs.k8s.io/docs/start/)