FactoryBot.define do
  factory :user do
    sequence(:login) { |i| "User #{i}" }
  end
end
