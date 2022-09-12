# INSTALL DOCKER

# Uninstall old versions
# ---------------------------------------------- #

# 1- Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them
sudo apt-get remove docker docker-engine docker.io containerd runc

# ---------------------------------------------- #



# Install using the repository
# ---------------------------------------------- #

# 1- Set up the repository
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 2- Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 3- Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# ---------------------------------------------- #



# Install Docker Engine
# ---------------------------------------------- #

# 1- Install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 2- Verify that Docker Engine is installed correctly by running the hello-world image
sudo service docker start
sudo docker run hello-world

# ---------------------------------------------- #