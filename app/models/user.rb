class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessor :answer, :rightanswer
  has_many :user_cart_items
  has_many :products, :through => :user_cart_items
  def validate_on_create
    errors.add_to_base("Špatná odpověď na otázku.") unless (not answer.nil? and answer == rightanswer)
  end
end
