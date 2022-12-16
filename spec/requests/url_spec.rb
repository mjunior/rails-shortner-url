require 'sidekiq/testing/inline'
require 'rails_helper'

RSpec.describe "Urls", type: :request do
  let(:title_job) { double(TitleParserJob) }

  describe "POST /url" do
    
    before { allow(title_job).to receive(:perform_async).and_return(1) }

    it "returns short url" do
      allow_any_instance_of(CreateShortUrlService).to receive(:call).and_return("mockShortUrl")

      post "/url", params: { url: "https://google.com.br" }

      expect(JSON.parse(response.body)["short"]).to eq("http://test.com/mockShortUrl")
    end

    it "returns error if url is invalid" do
      allow_any_instance_of(CreateShortUrlService).to receive(:call).and_return("mockShortUrl")

      post "/url", params: { url: "googlecom.br" }
      expect(JSON.parse(response.body)["url"][0]).to eq("is not an url. It should starts with https:// or http://")
    end

    it "should enqueue parse title job" do
      allow_any_instance_of(CreateShortUrlService).to receive(:call).and_return("mockShortUrl")

      Sidekiq::Testing.fake! { 
        post "/url", params: { url: "https://google.com.br" }
      }

      expect(TitleParserJob.jobs.size).to eq(1)
    end
  end

end
