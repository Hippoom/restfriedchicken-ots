require "rails_helper"
require 'rest_client'
require 'json'

describe 'ots-service' do
  context 'cannot provide service to the given order' do
    it "returns code 404" do

      response = nil

      begin
        response = RestClient.get 'http://127.0.0.1:3000/orders/1'
      rescue RestClient::ResourceNotFound

      end

      fail if response
    end
  end

  context 'handles put request with the given order' do
    it "returns code 201" do

      response = RestClient.put 'http://127.0.0.1:3000/orders/2', {}.to_json

      expect(response.code).to be_equal 201

      body = JSON.parse response.to_str

      expect(body['id']).to eq "2"
    end
  end
end
