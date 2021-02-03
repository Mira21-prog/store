server "138.197.176.49", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "ubuntu-s-1vcpu-1gb-fra1-01"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "138.197.176.49"
set :puma_conf, "#{shared_path}/config/puma.rb"
