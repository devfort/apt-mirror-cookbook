package "apt-mirror"

directory node.apt_mirror.data_dir do
  owner node.apt_mirror.user
  group node.apt_mirror.user
  mode "0755"
end

{
  "mirror.list.erb" => "/etc/apt/mirror.list",
  "services/apt-mirror.conf.erb"      => "/etc/init/apt-mirror.conf",
  "services/apt-mirror-shim.conf.erb" => "/etc/init/apt-mirror-shim.conf",
}.each do |src, target|
  template target do
    source src
    owner node.apt_mirror.user
    group node.apt_mirror.user
    mode "0644"
    recursive true
  end
end

service "apt-mirror-shim" do
  provider Chef::Provider::Service::Upstart
  action :restart
end

# Serve the gems (when they finish mirroring)
web_app "apt_mirror" do
  docroot "#{node.apt_mirror.data_dir}/mirror/archive.ubuntu.com"
  hostname node.apt_mirror.apache.listen_hostname
  port node.apt_mirror.apache.listen_port
end
