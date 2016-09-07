
include_recipe 'chef-mesos-family'
include_recipe 'mesos::slave'
include_recipe 'marathon'
include_recipe 'marathon::service'


docker_installation 'default' do
  action :create
end

file '/etc/mesos-slave/containerizers' do
  content 'docker,mesos'
end

file '/etc/mesos-slave/executor_registration_timeout' do
  content '5mins'
end

