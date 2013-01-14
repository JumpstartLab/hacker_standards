class AddDeletedToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :deleted, :boolean, :default => false
    add_index  :standards, :deleted
  end
end
