class RemoveRemainingFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :remaining, :decimal
  end
end
