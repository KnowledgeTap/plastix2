class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :parentid
      t.string :name
      t.string :model
      t.string :ports
      t.string :valve
      t.string :color
      t.string :price

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
