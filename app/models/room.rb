class Room < ActiveRecord::Base
  attr_accessible :name, :temp, :building_id
  belongs_to :building
  has_many :posts
  has_many :votes
end
