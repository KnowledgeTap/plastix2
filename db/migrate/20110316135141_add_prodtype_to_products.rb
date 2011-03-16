class AddProdtypeToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :prodtype, :string
  end

  def self.down
    remove_column :products, :prodtype
  end
end
