class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  attr_accessor :state_human
end
