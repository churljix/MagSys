class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :text
      t.boolean :status
      t.boolean :visible

      t.timestamps
    end
    add_index(:messages, :sender_id)
    add_index(:messages, :recipient_id)
  end
end
