class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :about_us
      t.string :terms_and_conditions

      t.timestamps
    end
    Page.create
  end

  def self.down
    drop_table :pages
  end
end
