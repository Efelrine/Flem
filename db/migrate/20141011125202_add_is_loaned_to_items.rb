class AddIsLoanedToItems < ActiveRecord::Migration
  def change
    add_column :items, :is_loaned, :boolean, null: false, default: false
  end
end
