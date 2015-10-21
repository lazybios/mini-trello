class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :avator, default: "https://unsplash.it/48/48/?random"
      t.string :token

      t.timestamps null: false
    end
  end
end
