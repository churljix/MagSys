class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :invoice_id
      t.decimal :amount
      t.date :date

      t.timestamps
    end
    add_index(:payments, :invoice_id)
  end
end
