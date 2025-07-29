#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable docker
sudo systemctl start docker

USER_LOCAL=$(logname)
sudo usermod -aG docker "$USER_LOCAL"

echo
echo "Docker e Docker Compose instalados!"
echo "Usuário '$USER_LOCAL' adicionado ao grupo docker."
echo "Saia e entre novamente para aplicar as permissões (ou use 'newgrp docker')."
echo
echo "Para testar, execute:"
echo "  docker run hello-world"
echo "  docker compose version"
