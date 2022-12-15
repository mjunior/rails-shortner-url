class UrlController < ApplicationController
  def index
    Url.order_by(total_access: :desc).limit(100)
  end

  def create
    short_url = CreateShortUrlService.new(params[:url]).call

    url = Url.find_or_create_by(original: params[:url], short: short_url, total_access: 0)  

    if url.save
      TitleParserJob.perform_async(url.id)
      render json: url, status: 201
    else
      render json: url.errors, status: 422
    end
  end

  def redirect
    begin
      original_url = UrlRedirectionService.new(params[:short]).call
      redirect_to original_url, status: 301
    rescue => exception # TODO: specific exception here
      render json: exception.message, status: 404
    end
  end
end
