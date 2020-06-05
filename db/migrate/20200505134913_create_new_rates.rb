class CreateNewRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.numeric :rate
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
