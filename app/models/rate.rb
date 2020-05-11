class Rate < ApplicationRecord
  validates_numericality_of :rate, less_than_or_equal_to: 5, greater_than_or_equal_to: 1
  validates :post_id, presence: true
  belongs_to :post
end
