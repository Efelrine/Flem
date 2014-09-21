class AddPrimaryToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :is_primary, :boolean,null: false, default: false
  end
end
