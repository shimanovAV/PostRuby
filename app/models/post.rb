class Post < ApplicationRecord
  validates :title, :body, :author_ip, :user_id, presence: true
  has_many :rates
  belongs_to :user


  def average_rate
    @all_rates_for_post = Post.first.rates
    sum_of_all_rates = @all_rates_for_post.inject(0) { |result, elem| result = result + elem.rate }
    amount_of_rates = @all_rates_for_post.size != 0 ? @all_rates_for_post.size : 1
    sum_of_all_rates / amount_of_rates
  end

end
