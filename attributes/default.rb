default['apt_mirror']['data_dir'] = 'fort'
default['apt_mirror']['data_dir'] = '/data/apt'

default['apt_mirror']['remote_apt'] = 'http://archive.ubuntu.com/ubuntu'
default['apt_mirror']['release'] = 'raring'
default['apt_mirror']['architecture'] = 'amd64'

default['apt_mirror']['apache']['listen_hostname'] = '*'
default['apt_mirror']['apache']['listen_port'] = '80'

override['apache']['default_site_enabled'] = false
