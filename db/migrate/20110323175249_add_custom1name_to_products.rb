class AddCustom1nameToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :custom1name, :string
  end

  def self.down
    remove_column :products, :custom1name
  end
end
