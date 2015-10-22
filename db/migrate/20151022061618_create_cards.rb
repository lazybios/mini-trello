class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.integer :position
      t.text :description
      t.datetime :due_date
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
