class StaticsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:home, :about, :contact]
	
	def home 
		@resource ||= User.new
		@fav = Favourite.new
		@events = Event.all
		@clink = CollectionLink.new
		@links = HelpfulLink.all
		@link = HelpfulLink.new
	  	@user = current_user unless current_user.blank?
	  	@collections = Collection.all

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
