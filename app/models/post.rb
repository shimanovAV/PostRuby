class Post < ApplicationRecord

  validates :title, :body, :author_ip, :user_id, presence: true
  has_many :rates
  belongs_to :user

  def recount_average_rate
    sum_of_all_rates = rates.inject(0) { |result, elem| result = result + elem.rate }
    amount_of_rates = rates.size != 0 ? rates.size : 1
    self.average_rate = sum_of_all_rates / amount_of_rates
    self.save
  end
end