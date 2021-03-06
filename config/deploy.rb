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
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"

namespace :deploy do
  before 'check:linked_files', 'set:master_key'
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:jungle:setup'
end

after "deploy:finished", "puma:restart"

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :seed do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:seed'
        end
      end
    end
  end
end

# namespace :logs do
#   desc "tail rails logs"
#   task :tail_rails do
#     on roles(:app) do
#       execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
#     end
#   end
# end

# desc "tail production log files"
# task :tail_logs, :roles => :app do
#   trap("INT") { puts 'Interupted'; exit 0; }
#   run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
#     puts  # for an extra line break before the host name
#     puts "#{channel[:host]}: #{data}"
#     break if stream == :err
#   end
# end
