server_ip = ENV["SERVER_IP"] || "192.168.70.2"
gem_source = ENV["GEM_SOURCE"] || "https://ruby.taobao.org"

set :default_env, { gem_source: gem_source }
set :rails_env, :production
set :deploy_to, "/home/vagrant/"
set :branch, 'rails'
set :bundle_flags, '--deployment --verbose' # default is '--deployment --quiet'

server server_ip, user: 'vagrant', roles: %w{web app db}
