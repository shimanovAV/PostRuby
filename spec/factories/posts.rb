FactoryBot.define do
  sequence :title do |i|
    "Title #{i}"
  end
  sequence :body do |i|
    "Body #{i}"
  end
  sequence :author_ip do |i|
    "ee1rr2tt#{i}"
  end
  factory :post do
    title
    body
    author_ip
    average_rate { 0.0 }
    user {create(:user)}
  end
  factory :invalid_post, class: "Post" do
    title { nil }
    body { nil }
    author_ip { nil }
    user {create(:user)}
  end
  factory :create_post, class: "Post" do
    title
    body
    author_ip
  end
end
