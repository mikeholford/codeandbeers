class StaticsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:home, :about, :contact]

	def home 
		@resource ||= User.new
		@link = HelpfulLink.new
		@fav = Favourite.new
		@links = HelpfulLink.all
		@events = Event.all
		@user = current_user unless current_user.blank?
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

end
