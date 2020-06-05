class PostBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :posts, :user, index: true
  end
end
