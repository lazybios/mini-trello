class AddIsDeleteToComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_delete, :boolean, default: false
  end
end
