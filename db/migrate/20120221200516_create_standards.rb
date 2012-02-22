class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :title
      t.text :details
      t.integer :parent_id

      t.timestamps
    end
  end
end
