class ChangeTypeOfRate < ActiveRecord::Migration[6.0]
  def change
    change_column :rates, :rate, :integer
  end
end
