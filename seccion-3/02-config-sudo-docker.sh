# RUNNING THE DOCKER COMMAND WITHOUT SUDO

sudo usermod -aG docker ${USER}
su - ${USER}
id -nG