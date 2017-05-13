class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :search_query, null: false
      t.references :page, null: false
      t.references :link_group, null: false

      t.timestamps
    end
  end
end
