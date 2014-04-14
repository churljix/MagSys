class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :magazine_id
      t.integer :number
      t.date :date
      t.date :due_date
      t.string :status
      t.timestamps
    end
    add_index(:issues, :magazine_id)
  end
end
