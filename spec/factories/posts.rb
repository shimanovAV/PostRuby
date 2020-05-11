FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    author_ip { "MyString" }
    user {FactoryBot.create(:user)}
  end
  factory :invalid_post, class: "Post" do
    title { nil }
    body { nil }
    author_ip { nil }
    user {FactoryBot.create(:user)}
  end
  factory :create_post, class: "Post" do
    title { "MyString" }
    body { "MyText" }
    author_ip { "MyString" }
  end
end
