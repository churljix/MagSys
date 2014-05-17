class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :agency_id
      t.date :date
      t.decimal :discount
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
    add_index(:contracts, :agency_id)
    add_index(:contracts, :user_id)
  end
end
