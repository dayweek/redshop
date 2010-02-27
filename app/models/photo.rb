class Photo < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :title
  #validates_attachment_presence :photo
  #validates_attachment_content_type :photo, :content_type => 'image/jpeg'
  has_attached_file :photo, :styles => { :medium => "125x>", :thumb => "100x100>", :big => "700x500>" }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png'] 
end
