require 'nokogiri'
require 'open-uri'

class UpdateTitleService
  def initialize(url_id)
    @url_id = url_id
  end

  def call
    url = Url.find(@url_id)
    
    unless url.nil?
      html = URI.open(url.original)
      doc = Nokogiri::HTML(html)
      page_title = doc.css('title').text
      url.update!(title: page_title)
    end
  end
end