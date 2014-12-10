require 'rubygems'
require 'json'

class EnvironmentParser
  attr_reader :json

  def initialize(json)
    @json = json
  end

  def ip(host_name)
    options = JSON.parse(json)
    hosts = options.select do |key, value|
      options[key].keys.select do |key|
        key == host_name
      end
    end

    if hosts.empty? || !hosts[hosts.keys[0]].has_key?(host_name)
      raise NoSuchHostException, "No such host named %s" %[host_name]
    end
    hosts[hosts.keys[0]][host_name]['host']
  end
end

class NoSuchHostException < Exception
end