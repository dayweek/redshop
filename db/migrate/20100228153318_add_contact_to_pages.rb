class AddContactToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :contact, :string
  end

  def self.down
    remove_column :pages, :contact
  end
end
