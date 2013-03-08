class Vote < ActiveRecord::Base
  attr_accessible :amount, :room_id, :user_id, :building_id, :longitude, :latitude
  validates_presence_of :amount, :building_id
  belongs_to :room
  belongs_to :building
  after_create { |vote| Activity.create! action: "create", trackable: vote }

  def self.chart_data(start = 1.hour.ago)
	  votes = where(created_at: start.beginning_of_day..Time.zone.now)
  end

end
