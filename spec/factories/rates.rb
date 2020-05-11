FactoryBot.define do
  factory :rate do
    rate { 5 }
  end
  factory :invalid_rate, class: Rate do
    rate { nil }
  end
end
