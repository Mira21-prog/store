lock "~> 3.15.0"

set :repo_url, "https://github.com/Mira21-prog/store.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :user, "deployer"
set :rvm_ruby_version, "2.6.6"
set :pty, true

set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml", "config/master.key", "config/puma.rb")
set :linked_dirs,  fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads", "public/images", "storage")

set :config_example_suffix, ".example"
set :config_files, ["config/database.yml", "config/secrets.yml"]
set :nginx_use_ssl, false
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle .bundle public/system public/uploads storage}

namespace :deploy do
  before 'check:linked_files', 'set:master_key'
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:jungle:setup'
  before 'check:linked_files', 'puma:nginx_config'
end
after "deploy:finished", "nginx:restart"
after "deploy:finished", "puma:restart"
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
