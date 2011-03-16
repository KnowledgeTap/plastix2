class AddHoseToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :hose, :string
  end

  def self.down
    remove_column :products, :hose
  end
end
