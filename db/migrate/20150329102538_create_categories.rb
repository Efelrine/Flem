# encoding: UTF-8
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    Category.create(name: "Vêtement")
    Category.create(name: "Accessoire")
    Category.create(name: "Arme")
    Category.create(name: "Armure")
    Category.create(name: "Maquillage")
    Category.create(name: "Décoration")
    Category.create(name: "Matériel")
    Category.create(name: "Consommable")
    Category.create(name: "Autre")

    add_reference :items, :category, index:true
  end
end
