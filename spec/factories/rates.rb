FactoryBot.define do
  factory :rate do
    rate { rand(1..5) }
  end
  factory :invalid_rate, class: Rate do
    rate { nil }
  end
end
