class CreateTickets < ActiveRecord::Migration[5.1]
  def up
    create_table :tickets do |t|
      t.integer :number_of_place
      t.boolean :available
      t.integer :price
      t.references :timetable, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :tickets
  end
end
