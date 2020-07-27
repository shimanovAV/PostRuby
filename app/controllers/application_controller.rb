class ApplicationController < ActionController::Base
  # add top level error handling, check rescue_from
  rescue_from StandardError do |e|
    render json: e.message, status: 422
  end
end
