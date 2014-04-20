class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :total
      t.decimal :remaining
      t.date :date
      t.date :due_date
      t.integer :contract_id
      t.string :note

      t.timestamps
    end
    add_index(:invoices, :contract_id)
  end
end
