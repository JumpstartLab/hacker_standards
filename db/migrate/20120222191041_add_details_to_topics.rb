class AddDetailsToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :details, :text

  end
end
