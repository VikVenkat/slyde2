class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActionController::RoutingError, :with => :error_msg
  rescue_from NoMethodError, :with => :error_msg
  
  private
  def error_msg
    flash[:error] = "Sorry, can't do that!"
	redirect_to :root
  end
end
