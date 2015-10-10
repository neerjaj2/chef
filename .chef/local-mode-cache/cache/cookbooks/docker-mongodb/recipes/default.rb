#
# Cookbook Name:: docker-mongodb
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
        action [:create, :start]
end

docker_image 'neerjaj2/mongodb' do
        action :pull
end

docker_container 'launch' do
        repo 'neerjaj2/mongodb'
        tag 'latest'
        hostname 'mongo1'
        domain_name 'ttnd.com'
        publish_all_ports
        command '--replSet ttnd --noprealloc --smallfiles'
end

