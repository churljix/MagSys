class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :title
      t.string :reg_number
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
