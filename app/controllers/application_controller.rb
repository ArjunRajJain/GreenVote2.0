class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end

def track_activity(trackable, action = params[:action])
  current_user.activities.create! action: action, trackable: trackable
end