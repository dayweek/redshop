class AddShipmentAndPaymentToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :shipment_type, :string
    add_column :orders, :payment_type, :string
    Order.update_all("payment_type = 'bank_transfer'" )
    Order.update_all("shipment_type = 'ceska_posta'")
  end

  def self.down
    remove_column :orders, :payment_type
    remove_column :orders, :shipment_type
  end
end
