class AddBelongsToPostForRate < ActiveRecord::Migration[6.0]
  def change
    add_reference(:posts, :rate, index: true)
  end
end
