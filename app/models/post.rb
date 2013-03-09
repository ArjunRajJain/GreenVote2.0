class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  attr_accessible :content
  after_create { |post| Activity.create! action: "create", trackable: post }

end
