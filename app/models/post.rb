class Post < ApplicationRecord
  validates :title, :body, :author_ip, :user_id, presence: true
  has_many :rates
  belongs_to :user

  def recount_average_rate
    @all_rates_for_post = rates
    sum_of_all_rates = @all_rates_for_post.inject(0) { |result, elem| result = result + elem.rate }
    amount_of_rates = @all_rates_for_post.size != 0 ? @all_rates_for_post.size : 1
    self.average_rate = sum_of_all_rates / amount_of_rates
    self.save
  end

end
