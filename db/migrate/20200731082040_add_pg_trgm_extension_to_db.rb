class AddPgTrgmExtensionToDb < ActiveRecord::Migration[6.0]
  def change
    execute "create extension pg_trgm;"
    execute "CREATE INDEX users_on_login_idx ON users USING GIN(login gin_trgm_ops);"
  end
end
