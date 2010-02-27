class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.float :shipping_ceska_posta_price
      t.string :bank_account_number
      t.string :bank_account_title

      t.timestamps
    end
    Setting.new(:shipping_price => 100, :bank_account_title => 'mBank', :bank_account_number => 55555).save!
  end

  def self.down
    drop_table :settings
  end
end
