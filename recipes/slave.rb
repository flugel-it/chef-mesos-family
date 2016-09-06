
include_recipe 'chef-mesos-family'
include_recipe 'mesos::slave'
include_recipe 'marathon'
include_recipe 'marathon::service'


