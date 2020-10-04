#!/bin/bash
URL=https://storage.googleapis.com/kubernetes-release/release/

curl -LOs "$URL`curl -s $URL/release/stable.txt`/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
