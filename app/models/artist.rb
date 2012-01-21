class Artist < ActiveRecord::Base
  belongs_to :career
  has_many :artpieces
end
