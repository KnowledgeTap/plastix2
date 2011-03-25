class AddThreadToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :thread, :string
  end

  def self.down
    remove_column :products, :thread
  end
end
