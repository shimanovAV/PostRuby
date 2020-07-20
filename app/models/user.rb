class User < ApplicationRecord
  # require to be not null in migration
  # should it also be unique?
  validates :login, presence: true
  has_many :posts
end
