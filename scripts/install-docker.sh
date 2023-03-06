#! /bin/bash
set -e

yay -S docker docker-compose
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker
