class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :agency_id

      t.timestamps
    end
    add_index(:users, :agency_id)
  end
end
