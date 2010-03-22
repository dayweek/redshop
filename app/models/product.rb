class Product < ActiveRecord::Base
   #has_friendly_id :title, :use_slug => true, :strip_diacritics => true
   #validates_inclusion_of :category_id, :in => Category.all.map { |c|  c.id },  :message => "{{value}} is not a valid size", :allow_nil => false
   validates_presence_of :title
   validates_numericality_of :price, :greater_than_or_equal_to => 0
   validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0
   validates_associated :category
   validates_presence_of :category

   belongs_to :category
   has_many :photos, :dependent => :destroy 
   has_many :users, :through => :user_cart_items
   has_many :user_cart_items
   
   def self.find_top
     find(:all, :include => :photos, :order => 'rand()', :limit => 2)
   end

   def photo_url(type)
     if photos.first then
       return photos.first.photo.url(type)
     else
       return 'client/thumb1.gif'
     end
   end
end
