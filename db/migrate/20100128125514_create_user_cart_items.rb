class CreateUserCartItems < ActiveRecord::Migration
  def self.up
    create_table :user_cart_items do |t|
      t.integer :quantity
      t.references :user
      t.references :product
    end
  end

  def self.down
    drop_table :user_cart_items
  end
end
