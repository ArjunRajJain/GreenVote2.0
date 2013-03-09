class BuildingsController < ApplicationController
  # POST /buildings
  # POST /buildings.json
  def index
    @buildings = Building.all
     i = 0
     @votes = []
     @buildings.each do |building|
       @votes[building.id] = Vote.where(building_id: building.id, created_at: 1.hour.ago..Time.zone.now)
      end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buildings }
    end
  end
  
  def import
    Building.import(params[:file],Building.find(params[:id]))
    redirect_to buildings_url, notice: "Rooms imported."
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    @building = Building.find(params[:id])
    @votes = Vote.where(building_id: params[:id],created_at: 1.hour.ago..Time.zone.now)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @building }
    end
  end


  def new
    @building = Building.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @building }
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def create
    @building = Building.new(params[:building])

    respond_to do |format|
      if @building.save
        format.html { redirect_to buildings_url, notice: 'building was successfully created.' }
        format.json { render json: @building, status: :created, location: @building }
      else
        format.html { render action: "new" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.json
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        format.html { redirect_to buildings_url, notice: 'building was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to buildings_url }
      format.json { head :no_content }
    end
  end
end
