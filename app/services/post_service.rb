class PostService
  def get_all_sorted_posts(count)
    posts = Post.all.sort_by do |post|
      -(post.average_rate)
    end
    posts[0, count]
  end

  def create_post(post_params)
    user = User.where(login: post_params[:user_login]).first_or_create
    Post.new(title: post_params[:title],
                     body: post_params[:body],
                     author_ip: post_params[:author_ip],
                     user: user)
  end

  def get_all_ips
    ips = {}
    Post.all.each do |post|
      ips[post.author_ip.to_sym] = ips[post.author_ip.to_sym] == nil ? [] : ips[post.author_ip.to_sym]
      ips[post.author_ip.to_sym] << post.user.login
      ips[post.author_ip.to_sym].uniq!
    end
    ips
  end
end