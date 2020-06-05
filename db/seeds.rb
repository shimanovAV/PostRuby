# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author_ip_seq = []
(1..50).each do |i|
  author_ip_seq << "ee123ee#{i}"
end
(1..100).each do |num|
  user = User.where(login:"User #{num}").first_or_create
  (2000).times do
    post = Post.create(title: "MyString", body: "MyText", author_ip: author_ip_seq[rand(0..4)], average_rate:0.0,  user: user)
    num.times do
      post.rates.create(rate: rand(1..5))
    end
    post.recount_average_rate
  end
end
