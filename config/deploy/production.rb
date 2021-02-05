server "138.197.176.49", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "ubuntu-s-1vcpu-1gb-fra1-01"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "ghapple-store.ddnsking.com"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :default_env, {
  'api_key' => '515134793371451'
}
