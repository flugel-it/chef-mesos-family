
include_recipe 'chef-mesos-family'
include_recipe 'mesos::slave'


docker_installation 'default' do
  action :create
end

docker_service_manager 'default' do
  action :start
end

