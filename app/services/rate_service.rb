class RateService
  def create_rate(post_params, rate_params)
    post = Post.find(post_params)
    Rate.new(rate: rate_params[:rate],
                    post: post)
  end
end