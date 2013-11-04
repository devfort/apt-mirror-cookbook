package "apt-mirror"

template "/etc/apt/mirror.list" do
  source "mirror.list.erb"
  owner node.apt_mirror.user
  group node.apt_mirror.user
  mode "0644"
end

mirror "apt" do
  target node.apt_mirror.data_dir
  user node.apt_mirror.user
  hostname node.apt_mirror.apache.listen_hostname
  port node.apt_mirror.apache.listen_port
  command "apt-mirror"
  cookbook "mirror-core"
end
