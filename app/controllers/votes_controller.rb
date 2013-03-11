class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.where(building_id: params[:id],created_at: 1.hour.ago..Time.zone.now)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes.to_json(:only => [:created_at, :amount]) }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])
    respond_to do |format|
      format.json { render json: @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    @post = Post.new(params[:post])
    @post.room_id = @vote.room_id
    @post.user_id = current_user.id
    @vote.user_id = current_user.id

    respond_to do |format|
      if @vote.save
        if @post.content != "" 
        @post.save
        track_activity @post
        end
        track_activity @vote
        
        
        @vote.trigger_view_event
        format.html { redirect_to :controller => 'welcome'}
        format.json { redirect_to :controller => 'welcome'}
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])
    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end
end
