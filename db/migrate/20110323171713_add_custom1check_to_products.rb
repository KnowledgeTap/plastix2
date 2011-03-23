class AddCustom1checkToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :custom1check, :tinyint
  end

  def self.down
    remove_column :products, :custom1check
  end
end
