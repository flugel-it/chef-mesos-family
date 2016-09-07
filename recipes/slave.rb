
include_recipe 'chef-mesos-family'
include_recipe 'mesos::slave'


docker_installation 'default' do
  action :create
end

docker_service_manager 'default' do
  action :start
end

file '/etc/mesos-slave/containerizers' do
  content 'docker,mesos'
end

file '/etc/mesos-slave/executor_registration_timeout' do
  content '5mins'
end

