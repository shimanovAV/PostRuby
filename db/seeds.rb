# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
include FactoryBot::Syntax::Methods

post_service = PostService.new
rate_service = RateService.new
users = create_list(:user, 100)
users.each_with_index do |user, i|
  (2000).times do
    post = post_service.create_post(attributes_for(:create_post).merge(user_login: user.login))
    post.save
    i.times do
      rate = rate_service.create_rate(post.id, attributes_for(:rate))
      rate.save
    end
  end
end
=end
author_ip_seq = []
(1..5).each do |i|
  author_ip_seq << "ee123ee#{i}"
end
(1..10).each do |num|
  user = User.where(login:"User #{num}").first_or_create
  (20).times do
    post = Post.create(title: "MyString", body: "MyText", author_ip: author_ip_seq[rand(0..4)], average_rate:0.0,  user: user)
    num.times do
=begin
      rate = Rate.create(rate: rand(1..5), post: post)
      rate.save
=end
      post.rates.create(rate: rand(1..5))
    end
    post.recount_average_rate
  end
end
