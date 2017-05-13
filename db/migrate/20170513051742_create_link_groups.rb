class CreateLinkGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :link_groups do |t|
      t.string :title, null: false
      t.references :page, null: false
      t.timestamps
    end
  end
end
