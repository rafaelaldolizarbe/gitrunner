#!/bin/bash

# Atualize os pacotes existentes
sudo apt update -y

# Instale o Docker
sudo apt install docker.io -y

# Adicione o usuário atual $(whoami) ao grupo docker
sudo usermod -a -G docker $(whoami)

# Inicie o Docker
sudo systemctl start docker

sudo docker run --name new_front -d -p 80:80 -p 443:443 rafaellizarbe95/front_easy:v4.0

# Create a folder
# sudo mkdir actions-runner && cd actions-runner
# # Download the latest runner package
# sudo curl -o actions-runner-linux-x64-2.316.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.1/actions-runner-linux-x64-2.316.1.tar.gz
# # Optional: Validate the hash
# sudo echo "d62de2400eeeacd195db91e2ff011bfb646cd5d85545e81d8f78c436183e09a8  actions-runner-linux-x64-2.316.1.tar.gz" | shasum -a 256 -c
# # Extract the installer
# sudo tar xzf ./actions-runner-linux-x64-2.316.1.tar.gz

# ./config.sh --url $REPO_URL --token $TOKEN --unattended --name $RUNNER_NAME --work $WORK_DIR --labels $LABELS

# nohup ./run.sh > output.log 2>&1 &