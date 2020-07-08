class PostsController < ApplicationController

  respond_to :json

  def top_posts
    respond_with(service.get_all_sorted_posts(count_params))
  end


  def create
    post = service.create_post(post_params)
    respond_with post, location: -> { posts_path }
  end

  def ips
    respond_with(service.get_all_ips)
  end

  private

  def post_params
    params.permit(:title, :body, :user_login, :author_ip)
  end

  def count_params
    params.permit(:count)
  end

  def service
    @service ||= PostService.new
  end
end
