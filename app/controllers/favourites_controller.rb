class FavouritesController < ApplicationController

	def index 
		@fav = Favourite.where(user_id: current_user)
	end

	def new
		@fav = Favourite.new    
	end

	def create
		@fav = Favourite.new(fav_params)
		if @fav.save
			# RequestMailer.new_request_agents(@request, User.find(@request.user_id)).deliver
			flash[:notice] = "Added to favourites"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy
		@fav.destroy
		respond_to do |format|
			format.html { redirect_to root_url }
			format.json { head :no_content }
		end
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def fav_params
		params.require(:favourite).permit(:user_id, :helpful_link_id)
	end



end
