require 'rails_helper'

RSpec.describe "Hellos", type: :request do
  describe "GET /index" do
    it "returns http success" do

      allow(HelloWorldJob).to receive(:perform_async).with(1).and_return(true)

      get "/hello/index"
      expect(JSON.parse(response.body)["msg"]).to eq('hello world')
    end
  end

end
