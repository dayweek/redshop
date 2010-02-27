class CreateKeepers < ActiveRecord::Migration
  def self.up
    create_table :keepers do |t|
      t.string :login
      t.string :email
      t.string :encrypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end
    #a  = Admin::Keeper.new (:login => 'admin', :password => 'admin', :password_confirmation => 'admin',:email => 'aaa@aaa.cz')
    #a.save!
  end

  def self.down
    drop_table :keepers
  end
end
