class AddAdditionalsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :city, :string
    add_column :users, :name, :string
    add_column :users, :post_code, :string
    add_column :users, :street, :string
  end

  def self.down
    remove_column :users, :street
    remove_column :users, :post_code
    remove_column :users, :name
    remove_column :users, :city
  end
end
