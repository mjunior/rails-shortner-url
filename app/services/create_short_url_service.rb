require 'digest'

class CreateShortUrlService
  def initialize(original_url)
    @original_url = original_url
    @sha256 = Digest::SHA256.new
  end
  
  def call
    url = Url.find_by(original: @original_url)
    if url.nil?
      @sha256.hexdigest @original_url
    else
      url.short
    end
  end
end