class AddIndexToPages < ActiveRecord::Migration[5.1]
  def change
    add_index :pages, :slug, unique: true
  end
end
