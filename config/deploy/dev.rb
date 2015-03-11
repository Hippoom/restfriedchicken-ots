server_ip = ENV["SERVER_IP"] || "192.168.70.2"
gem_source = ENV["GEM_SOURCE"] || "https://ruby.taobao.org"

set :default_env, { gem_source: gem_source }

set :deploy_to, "/home/vagrant/ots/"
set :bundle_flags, '--deployment --verbose' # default is '--deployment --quiet'

#set :repo_url, 'file:///Users/twer/Workspace/restfriedchicken-ots/.git/'

server server_ip, user: 'vagrant', roles: %w{web app db}
