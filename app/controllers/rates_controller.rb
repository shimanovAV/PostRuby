class RatesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :service_initialization


  def create
    @rate = @service.create_rate(post_params, rate_params)
    if @rate.save
      render json: @average_rate = @rate.post.average_rate, status: :created
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post_id)
  end

  def rate_params
    params.require(:rate).permit(:rate)
  end

  def service_initialization
    @service = RateService.new
  end
end