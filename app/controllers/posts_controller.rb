class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by do |post|
      post.average_rate
    end
    render json: @posts = @posts[0, count_params]
  end


  def create
    @user = User.where(login: post_params[:user_login]).first_or_create
    @post = Post.new(title: post_params[:title],
                     body: post_params[:body],
                     author_ip: post_params[:author_ip],
                     user: @user)
      if @post.save
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
  end

  def ips_index
    @ips = {}
    Post.all.each do |post|
      @ips[post.author_ip.to_sym] = @ips[post.author_ip.to_sym] == nil ? [] : @ips[post.author_ip.to_sym]
      @ips[post.author_ip.to_sym] << post.user.login
    end
    render json: @ips
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_login, :author_ip)
  end

  def count_params
    params.require(:count).to_i
  end
end
