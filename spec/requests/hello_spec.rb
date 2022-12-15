require 'rails_helper'

RSpec.describe "Hellos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/hello/index"
      expect(JSON.parse(response.body).size).to eq(18)
    end
  end

end
