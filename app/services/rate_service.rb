class RateService
  def initialize_rate(rate_params)
    post = Post.find(rate_params[:post_id])
    num = rate_params[:rate].to_i
    Rate.new(rate: num, post: post)
  end
end