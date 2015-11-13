class CreateConcertnets < ActiveRecord::Migration
  def change
    create_table :concertnets do |t|
      t.string :artist
      t.string :venue
      t.string :city
      t.datetime :date
      t.float :price
      t.text :description

      t.timestamps null: false
    end
  end
end
