#!/bin/bash

echo "++ Instalación de kubectl ++"
sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

echo "++ Chequeo de la configuración de kubectl ++"
kubectl cluster-info

echo "++ Hacer kubectl accesible para el usuario vagrant ++"
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

echo "++ Inicio del Dashboard ++"
kubectl proxy --address='0.0.0.0'
