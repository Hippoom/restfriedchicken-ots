require_relative '../lib/environment_parser'

describe "the evironment parser" do
  it "returns ip given host name" do
    json = '{
              "group": {
                "host1": {
                  "host": "192.168.0.2",
                  "user": "admin",
                  "pass": "123456",
                  "var1": "1"
                },
                "vars": {
                  "group_var1":"g1",
                  "group_var2":"g2"
                }
              }
            }'
    parse = EnvironmentParser.new(json)
    expect(parse.ip('host1')).to eq('192.168.0.2')
  end

  it "raise exception given host name but not found" do
    json = '{
              "group": {
                "host1": {
                  "host": "192.168.0.2",
                  "user": "admin",
                  "pass": "123456",
                  "var1": "1"
                },
                "vars": {
                  "group_var1":"g1",
                  "group_var2":"g2"
                }
              }
            }'
    parse = EnvironmentParser.new(json)

    expect { parse.ip('a_host_not_exist') }.to raise_error(NoSuchHostException, "No such host named a_host_not_exist")
  end
end

