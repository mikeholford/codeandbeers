class CollectionLinksController < ApplicationController



	def create
		@clink = CollectionLink.new(clink_params)
		# @clink.user_id = current_user.id
		if @clink.save
			# RequestMailer.new_request_agents(@request, User.find(@request.user_id)).deliver
			flash[:notice] = "Added to collection. Thanks!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	# TO UPDATE BELOW CODE!!!!!
	
	def update
		@clink = HelpfulLink.find(params[:id]) 
		# @user = User.find(params[:user_id]) 
		if @clink.update_attributes(link_params)
			flash[:notice] = "Link Updated. Thank you #{current_user.username}!"
			redirect_to root_url
		else
			flash[:alert] = "Could not update..."
			redirect_to root_url
		end
	end

	def destroy
		@clink.destroy
		respond_to do |format|
			format.html { redirect_to root_url }
			format.json { head :no_content }
		end
	end

	private

	def clink_params
		params.require(:collection_link).permit(:collection_id, :helpful_link_id)
	end


end
