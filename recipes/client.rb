apt_repository 'fort' do
  uri node['apt_mirror']['client_uri']
  distribution node['apt_mirror']['release']
  components ['main', 'restricted', 'universe', 'multiverse']
  deb_src true
end
