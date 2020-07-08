class RatesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @rate = service.initialize_rate(rate_params)
    if @rate.save
      render json: @rate.post.average_rate, status: :created
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  private

  def rate_params
    params.permit(:rate, :post_id)
  end

  def service
    @service ||= RateService.new
  end
end