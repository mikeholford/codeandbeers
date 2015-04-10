class StaticsController < ApplicationController

	def home 
		@resource ||= User.new
	end

	def about
		
	end

end
