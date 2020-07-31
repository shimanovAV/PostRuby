class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension :pg_trgm

    create_table :users do |t|
      t.string :login, :null => false, :index => { :unique => true }
      t.index :name, :opclass => :gin_trgm_ops, :using => :gin

      t.timestamps
    end
  end
end
