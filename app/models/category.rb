class Category < ActiveRecord::Base
   has_many :products, :dependent => :destroy 
   acts_as_list
   validates_presence_of :title
   has_friendly_id :title, :use_slug => true, :strip_diacritics => true
end
