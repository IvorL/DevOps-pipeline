# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

variables = {"DB_HOST" => "192.168.10.101"}

def set_variables(variables)
  command = ""
  variables.each do |key, value|
    command += <<~HEREDOC
      sudo sed -i "1iexport #{key}=#{value}" ~/.bashrc
    HEREDOC
  end
  command += <<~HEREDOC
    source ~/.bashrc
  HEREDOC
end

Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network("private_network", ip: "192.168.10.100")
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder("environment/app", "/home/ubuntu/environment")
    app.vm.synced_folder("app", "/home/ubuntu/app")
    app.vm.provision("shell", path: "environment/app/provision.sh", privileged: false)
    app.vm.provision("shell", inline: set_variables(variables), privileged: false)
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network("private_network", ip: "192.168.10.101")
    db.hostsupdater.aliases = ["development.local.db"]
    db.vm.synced_folder("environment/db", "/home/ubuntu/environment")
    db.vm.provision("shell", path: "environment/db/provision.sh", privileged: false)
  end



end
