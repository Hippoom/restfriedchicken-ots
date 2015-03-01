# config valid only for current version of Capistrano
lock '3.3.5'

SSHKit.config.command_map[:rake] = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

set :application, 'ots-service'

set :repo_url, 'https://github.com/Hippoom/restfriedchicken-ots.git'
set :branch, 'rails'

set :rails_env, :production

#set :rbenv_ruby, '2.2.0'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

desc 'Restart application'
task :restart do
  on roles(:app), in: :sequence, wait: 5 do
    execute "rails s -e production"  ## -> line you should add
  end
end

#after :publishing, :restart
