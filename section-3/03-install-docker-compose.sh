# INSTALL DOCKER COMPOSE

# INSTALL DOCKER COMPOSE PLUGIN
sudo apt-get update
sudo apt-get install docker-compose-plugin


# INSTALL DOCKER-COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version