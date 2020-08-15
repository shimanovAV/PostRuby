class RatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @rate = rate_service.initialize_rate(rate_params)
    if @rate.save
      render json: @rate.post.average_rate, status: :created
    else
      raise StandardError.new "Rate hasn't been saved"
    end
  end

  private

  def rate_params
    params.permit(:rate, :post_id)
  end

  def rate_service
    @rate_service ||= RateService.new
  end
end