class CreateBoardActivities < ActiveRecord::Migration
  def change
    create_table :board_activities do |t|
      t.text :content
      t.integer :user_id
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
