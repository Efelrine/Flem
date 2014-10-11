class AddLocationToItem < ActiveRecord::Migration
  def change
    add_column :items, :location, :string
    add_column :items, :is_lost, :boolean
  end
end
