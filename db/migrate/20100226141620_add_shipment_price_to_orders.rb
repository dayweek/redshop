class AddShipmentPriceToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :shipment_price, :float, :default => 0
  end

  def self.down
    remove_column :orders, :shipment_price
  end
end
