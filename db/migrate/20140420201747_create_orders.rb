class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :issue_id
      t.integer :field_id
      t.integer :client_id
      t.integer :user_id
      t.integer :contract_id
      t.string :title
      t.string :notes
      t.decimal :total_amount
      t.decimal :remaining
      t.decimal :special

      t.timestamps
    end
    add_index(:orders, :issue_id)
    add_index(:orders, :field_id)
    add_index(:orders, :client_id)
    add_index(:orders, :user_id)
    add_index(:orders, :contract_id)
  end
end
