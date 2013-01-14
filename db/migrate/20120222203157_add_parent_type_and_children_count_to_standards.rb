class AddParentTypeAndChildrenCountToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :parent_type, :string

    add_column :standards, :children_count, :integer, :default => 0

  end
end
