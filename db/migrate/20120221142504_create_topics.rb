class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.boolean :published, :default => false
      t.timestamps
    end
  end
end
