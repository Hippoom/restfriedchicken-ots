require 'serverspec'

set :backend, :ssh

host = ENV['TARGET_HOST']

options = {}
options[:user] = ENV['TARGET_SSH_USER']
options[:password] = ENV['TARGET_SSH_PASS']

set :host, host
set :ssh_options, options

