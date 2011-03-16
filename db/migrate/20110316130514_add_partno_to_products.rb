class AddPartnoToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :partno, :string
  end

  def self.down
    remove_column :products, :partno
  end
end
