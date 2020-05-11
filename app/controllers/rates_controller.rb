class RatesController < ApplicationController
  def create
    @post = Post.find(post_params)
    @rate = Rate.new(rate: rate_params[:rate],
                     post: @post)
    if @rate.save
      render json: @average_rate = @post.average_rate
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
end