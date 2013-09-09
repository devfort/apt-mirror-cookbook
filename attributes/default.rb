default['apt_mirror']['data_dir'] = 'fort'
default['apt_mirror']['data_dir'] = '/data/apt'

default['apt_mirror']['apache']['listen_hostname'] = '*'
default['apt_mirror']['apache']['listen_port'] = '80'

override['apache']['default_site_enabled'] = false
