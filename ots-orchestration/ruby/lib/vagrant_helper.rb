require 'rubygems'
require 'json'
require_relative 'environment_parser'

class VagrantHelper
  attr_reader :_file
  attr_reader :env_dir

  def initialize file, env_dir
    @_file = file
    @env_dir = File.expand_path(env_dir)
  end

  def host_name
    name_of working_directory
  end

  def env_name
    name_of parent_folder_of working_directory
  end

  def name_of(dir)
    names = dir.split('/')
    names[names.length - 1]
  end

  def parent_folder_of(dir)
    File.expand_path("..", dir)
  end


  def working_directory
    File.dirname _file
  end

  def env
    file = open(env_dir + "/" + env_name + ".json")
    config = file.read
    EnvironmentParser.new(config)
  end

  def ip
    env.ip host_name
  end

  private :working_directory, :parent_folder_of
end