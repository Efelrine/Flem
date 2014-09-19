class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :number
      t.text :comment
      t.integer :price

      t.timestamps
    end
  end
end
