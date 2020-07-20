FactoryBot.define do
  factory :user do
    # use sequence here to have unique "User_n" logins
    login { "User "}
  end
end
