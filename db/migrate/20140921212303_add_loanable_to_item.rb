class AddLoanableToItem < ActiveRecord::Migration
  def change
    add_column :items, :is_loanable, :boolean,null: false, default: false
  end
end
