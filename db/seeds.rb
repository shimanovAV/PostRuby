author_ip_seq = []
(1..5).each do |i|
  author_ip_seq << "ee123ee#{i}"
end
(1..10).each do |num|
  user = User.where(login: "User #{num}").first_or_create
  (2).times do
    post = Post.create(title: "MyString", body: "MyText", author_ip: author_ip_seq[rand(0..4)], average_rate: 0.0, user: user)
    num.times do
      post.rates.create(rate: rand(1..5))
    end
    post.recount_average_rate
  end
end
