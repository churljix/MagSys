class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :title
      t.integer :magazine_id
      t.decimal :height
      t.decimal :width
      t.decimal :price

      t.timestamps
    end
    add_index(:fields, :magazine_id)
  end
end
