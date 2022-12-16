class UrlController < ApplicationController
  def index
    serializer = ActiveModelSerializers::SerializableResource
    render json: serializer.new(Url.top_100, each_serializer: TopAccessedSerializer).as_json
  end

  def create
    url = Url.find_or_initialize_by(original: params[:url])

    render json: url, status: 200 and return if url.persisted?
    
    if url.save
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
