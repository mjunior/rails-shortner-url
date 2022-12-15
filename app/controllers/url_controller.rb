class UrlController < ApplicationController
  def index
  end

  def create
    short_url = CreateShortUrlService.new(params[:url]).call

    url = Url.new(original: params[:url], short: short_url, total_access: 0)  

    if url.save
      render json: url, status: 201
    else
      render json: url.errors, status: 422
    end
  end
end
