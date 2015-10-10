# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "neerjaj2"
client_key               "#{current_dir}/neerjaj2.pem"
validation_client_name   "ttnd-validator"
validation_key           "#{current_dir}/ttnd-validator.pem"
chef_server_url          "https://api.chef.io/organizations/ttnd"
cookbook_path            ["#{current_dir}/../cookbooks"]
