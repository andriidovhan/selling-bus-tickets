class AddPriceToTimetables < ActiveRecord::Migration[5.1]
  def up
    add_column "timetables", "price", :float
  end

  def down
    remove_column "timetables", "price"
  end
end
