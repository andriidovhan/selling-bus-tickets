class CreateUsers < ActiveRecord::Migration[5.1]

  def up
    create_table :users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 25
      t.string "email", :null => false
      t.string "password", :limit => 30, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
