class CreateTimetables < ActiveRecord::Migration[5.1]
  def up
    create_table :timetables do |t|
      t.integer "amount_of_place"
      t.string "place_depart"
      t.string "place_arrive"
      t.datetime "time_depart"
      t.datetime "time_arrive"

      t.timestamps
    end
  end

  def down
    drop_table :timetables
  end
end
