Vagrant.configure("2") do |config|
  
  
  config.vm.define "client" do |client|
    client.vm.box = "debian/buster64"
    client.vm.hostname = "client"
    client.vm.network "private_network", type: "static", ip: "192.168.56.10"
    client.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end
    
    client.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install ufw
      sudo ufw allow 5000  
      sudo ufw allow 22  
      sudo ufw allow 80  
      sudo ufw enable  # Habilitar UFW
      sudo ufw reload
      echo "192.168.56.10  client" >> /etc/hosts
      echo "192.168.56.11  dvserver" >> /etc/hosts
      sudo apt-get update
      sudo apt-get install python3

    
    SHELL

    # Provisioning with Ansible
    client.vm.provision "ansible" do |ansible|
      ansible.playbook = "clientplaybook.yml"
    end

  end
  
  
# mveerver node **
  config.vm.define "dbserver" do |dbserver|
    dbserver.vm.box = "debian/buster64"
    dbserver.vm.hostname = "dbserver"
    dbserver.vm.network "private_network", type: "static", ip: "192.168.56.11"
    dbserver.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end

# Configuración para MariaDB**
    #dbserver.vm.network "forwarded_port", guest: 3306, host: 3306
    dbserver.vm.provision "shell", inline: <<-SHELL
       sudo apt-get update
       sudo apt-get install ufw
       sudo ufw allow 3306
       sudo ufw enable  # Habilitar UFW
       sudo ufw reload
       echo "192.168.56.10  client" >> /etc/hosts
       echo "192.168.56.11  dbserver" >> /etc/hosts
    SHELL
# Provisioning with Ansible
    dbserver.vm.provision "ansible" do |ansible|
      ansible.playbook = "dbserverplaybook.yml"
    end
# Agregar el comando para ejecutar dump-myproject.sql
dbserver.vm.provision "shell", inline: "mysql -u isabel -p'isabel' < /vagrant/dump-myproject.sql"


  end
  
  
  
  
end
