class EventsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:index]
	def index
		@events = Event.all
	end
end
