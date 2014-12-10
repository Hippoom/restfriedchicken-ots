require_relative '../lib/vagrant_helper'


describe "the vagrant helper" do

  subject = VagrantHelper.new(__FILE__, '')


  it "returns the dirname of the working directory as host" do
    _expect = subject.host_name

    expect(_expect).to eq('specs')
  end

  it "returns the parent dirname of the working directory as env" do
    _expect = subject.env_name

    expect(_expect).to eq('ruby')
  end

end


