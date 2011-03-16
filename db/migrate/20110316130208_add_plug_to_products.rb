class AddPlugToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :plug, :string
  end

  def self.down
    remove_column :products, :plug
  end
end
