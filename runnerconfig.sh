#!/bin/bash

# Atualize os pacotes existentes
sudo apt update -y

# Instale o Docker
sudo apt install docker.io -y

# Adicione o usuário atual $(whoami) ao grupo docker
sudo usermod -a -G docker $(whoami)

# Inicie o Docker
sudo systemctl start docker

sudo docker run hello-world