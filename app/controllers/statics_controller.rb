class StaticsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:home, :about]

	def home 
		@resource ||= User.new
		@link = HelpfulLink.new
		@links = HelpfulLink.all
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

end
