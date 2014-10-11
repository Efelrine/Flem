class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :number
      t.date :date_loan
      t.string :state
      t.boolean :is_rendered
    end
  end
end
