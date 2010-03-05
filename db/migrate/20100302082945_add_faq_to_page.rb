class AddFaqToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :faq, :string
  end

  def self.down
    remove_column :pages, :faq
  end
end
