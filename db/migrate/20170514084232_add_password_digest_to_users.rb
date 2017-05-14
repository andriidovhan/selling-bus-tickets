class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column "users", "password"
    add_column "users", "password_digest", :string
  end

  def down
    remove_column "users", "password_digest"
    add_column "users", "password", :string, :limit => 30
  end
end
