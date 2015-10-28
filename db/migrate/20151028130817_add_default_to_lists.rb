class AddDefaultToLists < ActiveRecord::Migration
  def change
    change_column :lists, :position, :integer, :default => 0
  end
end
