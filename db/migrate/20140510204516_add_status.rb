class AddStatus < ActiveRecord::Migration
  def change
	add_column :agencies, :status, :string
	add_column :clients, :status, :string
	add_column :contracts, :status, :string
	add_column :fields, :status, :string
	add_column :invoices, :status, :string
	add_column :payments, :status, :string
	add_column :users, :status, :string
  end
end
