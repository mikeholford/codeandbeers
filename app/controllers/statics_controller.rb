class StaticsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:home, :about]

	def home 
		@resource ||= User.new
		if signed_in?
			render :dashboard
		end
	end

	def dashboard
	end

	def about
	end

end
