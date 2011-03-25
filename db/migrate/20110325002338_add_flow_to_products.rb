class AddFlowToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :flow, :string
  end

  def self.down
    remove_column :products, :flow
  end
end
