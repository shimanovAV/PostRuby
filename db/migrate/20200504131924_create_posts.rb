class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author_ip
      t.float :average_rate
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
