class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :agency_id
      t.date :date
      t.decimal :discount
      t.string :notes
      t.integer :last_updated_by

      t.timestamps
    end
    add_index(:contracts, :agency_id)
    add_index(:contracts, :last_updated_by)
  end
end
