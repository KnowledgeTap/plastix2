class AddCustom1ToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :custom1, :string
  end

  def self.down
    remove_column :products, :custom1
  end
end
