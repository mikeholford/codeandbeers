class StaticsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:home, :about, :contact]
	before_action :set_globals
	
	def home 
		@resource ||= User.new
		@fav = Favourite.new
		@events = Event.all
		if signed_in?
			render :dashboard
		end
	end

	def dashboard
		redirect_to root_url
	end

	def about
	end

	def contact
	end

	def sitemap
	end

	private

	def set_globals 
		@link = HelpfulLink.new
	  	@links = HelpfulLink.all
	  	@user = current_user unless current_user.blank?
	end

end
