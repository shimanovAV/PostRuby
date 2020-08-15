FactoryBot.define do
  sequence :login do |i|
    "User #{i}"
  end

  factory :user do
    login
  end
end
