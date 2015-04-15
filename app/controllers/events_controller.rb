class EventsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:index]
	before_action :set_globals
	

	def index
		@events = Event.all
	end


	private

	def set_globals 
		@link = HelpfulLink.new
	  	@links = HelpfulLink.all
	  	@user = current_user unless current_user.blank?
	end

end
