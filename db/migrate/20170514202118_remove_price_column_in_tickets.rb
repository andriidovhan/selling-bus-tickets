class RemovePriceColumnInTickets < ActiveRecord::Migration[5.1]
  def up
    remove_column "tickets", "price"
  end

  def down
    add_column "tickets", "price", :float
  end
end
