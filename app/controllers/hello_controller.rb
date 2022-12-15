require 'nokogiri'
require 'open-uri'

class HelloController < ApplicationController
  def index
    html = URI.open('https://g1.globo.com')
    doc = Nokogiri::HTML(html)
    news = doc.css("._evt a")

    response = news.map do |art|
      {
        title: art.text,
        link: art.attribute("href").value
      }
    end

    render json: response
  end
end
