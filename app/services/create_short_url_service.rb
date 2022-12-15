class CreateShortUrlService
  def initialize(original_url)
    @original_url = original_url
  end
  
  def call
    "fakeUrl"
  end
end