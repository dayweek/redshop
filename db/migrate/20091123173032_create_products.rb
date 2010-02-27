class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :size
      t.float :price
      t.integer :count
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
