require 'spec_helper'

describe package('jdk1.8.0_25') do
  it { should be_installed }
end

