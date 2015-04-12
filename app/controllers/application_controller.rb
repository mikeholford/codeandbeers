class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_globals

  private

  def set_globals 
  	@link = HelpfulLink.new
	@links = HelpfulLink.all
	@user = current_user unless current_user.blank?
  end

end
