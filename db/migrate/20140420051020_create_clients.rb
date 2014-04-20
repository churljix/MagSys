class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :title
      t.string :reg_number
      t.string :phone
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
