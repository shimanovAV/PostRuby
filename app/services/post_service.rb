class PostService
  def get_all_sorted_posts(params)
    posts = Post.all.sort_by do |post|
      -(post.average_rate)
    end
    top_count = params[:count].to_i
    posts[0, top_count]
  end

  def create_post(post_params)
    user = User.where(login: post_params[:user_login]).first_or_create
    Post.create(
        title: post_params[:title],
        body: post_params[:body],
        author_ip: post_params[:author_ip],
        user: user
    )
  end

  def get_all_ips
    ips = Hash.new { |h, k| h[k] = [] }
    Post.distinct(:author_ip).each do |post|
      ip = post.author_ip.to_sym
      ips[ip] << post.user.login unless ips[ip].include?(post.user.login)
    end
    ips
  end
end