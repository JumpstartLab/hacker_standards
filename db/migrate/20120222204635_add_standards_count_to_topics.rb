class AddStandardsCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :standards_count, :integer, :default => 0
  end
end
