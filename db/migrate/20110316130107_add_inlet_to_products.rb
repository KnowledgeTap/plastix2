class AddInletToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :inlet, :string
  end

  def self.down
    remove_column :products, :inlet
  end
end
