class CreateNewRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.numeric :rate
      t.belongs_to :post
      t.timestamps
    end
  end
end
