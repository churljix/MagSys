class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.string :text
      t.string :status
      t.boolean :visible

      t.timestamps
    end
    add_index(:messages, :user_id)
    add_index(:messages, :recipient_id)
  end
end
