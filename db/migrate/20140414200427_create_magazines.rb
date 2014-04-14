class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.integer :issue
      t.integer :prints
      t.integer :subscribers
      t.integer :readership
      t.string :picture
      t.string :status

      t.timestamps
    end
  end
end
