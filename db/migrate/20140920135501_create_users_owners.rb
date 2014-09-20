class CreateUsersOwners < ActiveRecord::Migration
  def change
    create_table :user_owners, id: false do |t|
    	t.belongs_to :user
    	t.belongs_to :owner
    end
  end
end
