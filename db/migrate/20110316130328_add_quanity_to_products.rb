class AddQuanityToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :quanity, :string
  end

  def self.down
    remove_column :products, :quanity
  end
end
