Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/bionic64"
    config.vm.box_version = "1.0.282"
    config.vm.hostname = "database"
    config.vm.boot_timeout = 360
    config.ssh.username = "vagrant"
    config.ssh.password = "vagrant"
    config.vm.provider "virtualbox" do |vb|
	vb.name = "postgres_8.4"
        vb.customize ["modifyvm", :id, "--memory", 1024 * 4]
    end
    config.vm.network "forwarded_port", guest: 5432, host: 5432
    config.vm.provision :shell, path: "provision_postgresql.sh"
end
