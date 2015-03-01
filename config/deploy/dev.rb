server_ip = ENV["SERVER_IP"] || "127.0.0.1"
gem_source = ENV["GEM_SOURCE"] || "https://ruby.taobao.org"

set :default_env, { gem_source: gem_source }
set :deploy_to, "/Users/twer/Workspace/ots/"
set :bundle_flags, '--deployment --verbose' # default is '--deployment --quiet'

set :repo_url, 'file:///Users/twer/Workspace/restfriedchicken-ots/.git/'
set :branch, 'rails'

server server_ip, user: 'twer', roles: %w{web app db}
