
### used by mysql
node.set['mysql']['service_name'] = 'default'
node.set['mysql']['server_root_password'] = 'toto'
node.set['mysql']['server_debian_password'] = 'postinstallscriptsarestupid'
node.set['mysql']['data_dir'] = '/var/lib/mysql'
node.set['mysql']['port'] = '3306'

### used in grants.sql
node.set['mysql']['allow_remote_root'] = false
node.set['mysql']['remove_anonymous_users'] = true
node.set['mysql']['root_network_acl'] = nil
