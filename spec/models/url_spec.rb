require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'validations' do
    it 'invalid with empty original url' do
      url = Url.new
      url.valid?
      expect(url.errors[:original]).to eq(['can\'t be blank'])
    end

    it 'invalid with wrong format' do
      url = Url.new
      url.original = "my-url-app"
      url.valid?
      expect(url.errors[:url]).to eq(['is not an url. It should starts with https:// or http://'])
    end
  end
end