class Building < ActiveRecord::Base
  attr_accessible :name, :address,:latitude,:longitude, :rooms_attributes,:tagId
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  has_many :rooms
  has_many :votes
  accepts_nested_attributes_for :rooms, allow_destroy: true
end