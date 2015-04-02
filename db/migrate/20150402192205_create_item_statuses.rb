class CreateItemStatuses < ActiveRecord::Migration
  def change
    create_table :item_statuses do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

  ItemStatus.create(name: "Non empruntable")
  ItemStatus.create(name: "Empruntable")
  ItemStatus.create(name: "Emprunté")
  ItemStatus.create(name: "Perdu")

  add_reference :items, :item_status, index:true
  remove_column :items, :is_loanable, :boolean
  remove_column :items, :is_loaned, :boolean
  remove_column :items, :is_lost, :boolean
  end
end