class AddForeignKeyToLoan < ActiveRecord::Migration
  def change
  	add_reference :loans, :item, index: true
  	add_reference :loans, :owner, index: true
  end
end
