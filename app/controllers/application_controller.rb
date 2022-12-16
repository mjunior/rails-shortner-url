class ApplicationController < ActionController::API
  rescue_from StandardError, with: :basic_error_handler

  def basic_error_handler(e)
    # improve this adding specific message, for each expection
    render json: { error: true, message: 'Internal Server Error' }, status: 500
  end
end
