class PostImage < ActiveRecord::Base
  belongs_to :post
 
  has_attached_file :photo,
  :styles =>{
    :thumb  => "100x100",
    :large => "600x400"
  },
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :bucket => '0503arts'
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
end
