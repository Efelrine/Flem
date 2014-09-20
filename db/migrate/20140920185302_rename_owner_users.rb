class RenameOwnerUsers < ActiveRecord::Migration
  def change
  	rename_table :user_owners, :owners_users
  end
end
