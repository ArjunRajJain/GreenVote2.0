class WelcomeController < ApplicationController
	helper_method :getBuildings
	def index
		logger.error "Index"
		if params[:lat].present?
		    @buildings = Building.near([params[:lat],params[:lon]], 0.1, :order => :distance)
		end
		if params[:tagid].present?
			@buildings = Building.where("tagid=?",params[:tagid])
		end
		@shop = false
		@client_ip = request.remote_ip
		@rooms = Room.all
		@vote = Vote.new
	end
	def getBuildings
		@building = Building.near([params[:lat],params[:lon]], 0.1, :order => :distance)
		if !@building.exists? 
			@buildings = Building.all
		end
		return @buildings
  	end
end
