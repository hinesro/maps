class Listing < ActiveRecord::Base
  validates_presence_of :title

  attr_accessible :title, :description, :price, :status
end
