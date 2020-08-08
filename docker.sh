#!/bin/bash

echo "++ Eliminar otras versiones de Docker"
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "++ Actualiza la cache de los repos ++"
sudo apt-get update

echo "++ Instalación de dependencias ++"
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent  software-properties-common

echo "++ Agrega la llave GPG de Docker ++"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "++ Agrega el repositorio stable ++"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "++ Actualiza la cache de los repos ++"
sudo apt-get update

echo "++ Instala la version 18.06.1 de Docker ++" 
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu

echo "++ Agrega el usuario vagrant al grupo docker ++"
usermod -aG docker vagrant
