
include_recipe 'chef-mesos-family'
include_recipe 'zookeeper::default'
include_recipe 'zookeeper::service'
include_recipe 'mesos::master'
include_recipe 'marathon'
include_recipe 'marathon::service'


