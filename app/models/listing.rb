class Listing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_presence_of :title
  belongs_to :category
end
