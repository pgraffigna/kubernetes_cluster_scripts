Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true	  

  config.vm.define "minikube" do |mini|
    mini.vm.box = "geerlingguy/ubuntu1604" 
    mini.vm.hostname = "mini.test"
    mini.vm.network "private_network", ip: "192.168.60.10"
    mini.vm.provision "shell", path: "docker.sh"
    mini.vm.provision "shell", path: "minikube.sh"
    mini.vm.provision "shell", path: "kubectl.sh"
  end

  config.vm.network "forwarded_port",
      guest: 8001,
      host:  8001,
      auto_correct: true   

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Minikube"
    vb.memory = "4096"
    vb.cpus = "1"
  end
end

# Dashboard
# http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default

# Para copiar archivos entre equipos
# scp -P 2222 -i /mnt/c/Users/USER/.vagrant.d/insecure_private_key 00-namespace.yml vagrant@127.0.0.1:~
