#!/bin/bash
echo "++ Descarga de Minikube ++"
curl -Lso minikube https://storage.googleapis.com/minikube/releases/v0.32.0/minikube-linux-amd64
chmod +x minikube

echo "++ Agrega el ejecutable al PATH ++"
sudo cp minikube /usr/local/bin/
rm minikube

echo "++ Inica el cluster ++"
minikube start --vm-driver=none
