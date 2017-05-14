class ChaneTypeColumnInTickets < ActiveRecord::Migration[5.1]
  def up
    change_column :tickets, :price, :float
  end

  def down
    change_column :tickets, :price, :integer
  end
end
