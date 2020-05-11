require 'rails_helper'

RSpec.describe Rate, type: :model do
  it do
    should validate_numericality_of(:rate).
    is_less_than_or_equal_to(5).
    is_greater_than_or_equal_to(1)
  end
  it {should belong_to :post}
  it { should validate_presence_of :post_id }
end
