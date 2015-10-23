class AddIsDeleteToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :is_delete, :boolean, :default => false
  end
end
