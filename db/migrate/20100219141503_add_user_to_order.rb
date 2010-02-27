class AddUserToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :user_id, :integer
    user = User.find(:first)
    Order.update_all("user_id = #{user.id}")
  end
  def self.down
    remove_column :orders, :user_id
  end
end
