class AddPortnoToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :portno, :string
  end

  def self.down
    remove_column :products, :portno
  end
end
