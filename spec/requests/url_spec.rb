require 'rails_helper'

RSpec.describe "Urls", type: :request do


  describe "POST /url" do
    it "returns http success" do
      allow_any_instance_of(CreateShortUrlService).to receive(:call).and_return("mockShortUrl")

      post "/url", params: { url: "https://google.com.br" }

      expect(JSON.parse(response.body)["short"]).to eq("mockShortUrl")
    end
  end

end
