class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  has_many :comments, :dependent => :destroy
  has_many :tags
  has_many :post_images, :dependent => :destroy
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :post_images, 
    :reject_if => lambda { |t| t['post_image'].nil? }
end