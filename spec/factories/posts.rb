FactoryBot.define do
  factory :post do
    # use sequences to get unique strings
    title { "MyString" }
    body { "MyText" }
    author_ip { "MyString" }
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
    title { "MyString" }
    body { "MyText" }
    author_ip { "MyString" }
  end
end
