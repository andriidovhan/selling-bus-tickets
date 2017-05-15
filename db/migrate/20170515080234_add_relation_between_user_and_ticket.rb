class AddRelationBetweenUserAndTicket < ActiveRecord::Migration[5.1]
  def up
    add_column "tickets", "user_id", :integer, :default => "NULL"
    add_reference "users", "ticket"
  end

  def down
    remove_column "tickets", "user_id"
    remove_reference "users", "ticket"
  end
end
