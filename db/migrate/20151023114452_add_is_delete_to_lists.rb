class AddIsDeleteToLists < ActiveRecord::Migration
  def change
    add_column :lists, :is_delete, :boolean, :default => false
    add_column :cards, :is_delete, :boolean, :default => false
  end
end
