
filter = "chef_environment:#{node.chef_environment} AND "
filter += "recipe:chef-mesos-family*master"
master = search(:node, filter)
if master.length != 1
  if Chef::Config.local_mode
    master = [ node ]
  else
    raise "Master not found or there is more than one master"
  end
end

master_ip = master[0]['ipaddress']
zk_mesos_url = "zk://#{master_ip}:2181/mesos"
zk_marathon_url = "zk://#{master_ip}:2181/marathon"

node.default['mesos']['master']['flags']['cluster'] = node.chef_environment
node.default['mesos']['master']['flags']['quorum'] = 1
node.default['mesos']['master']['flags']['zk'] = zk_mesos_url
node.default['mesos']['slave']['flags']['master'] = zk_mesos_url
node.default['marathon']['flags']['master'] = zk_mesos_url
node.default['marathon']['flags']['zk'] = zk_marathon_url
node.default['marathon']['flags']['task_launch_timeout'] = '300000'

