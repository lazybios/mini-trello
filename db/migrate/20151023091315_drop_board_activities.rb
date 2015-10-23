class DropBoardActivities < ActiveRecord::Migration
  def change
    drop_table :board_activities
  end
end
