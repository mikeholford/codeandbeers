class HelpfulLinksController < ApplicationController


	def new
		@link = HelpfulLink.new    
	end

	def show
		@link = HelpfulLink.find(params[:id]) 
	end

	def edit
		@user = User.find(params[:user_id]) 
		@link = HelpfulLink.find(params[:id]) 
	end

	def create
		@link = HelpfulLink.new(link_params)
		@link.user_id = current_user.id
		if @link.save
			# RequestMailer.new_request_agents(@request, User.find(@request.user_id)).deliver
			flash[:notice] = "Link submitted!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def update
		@link = HelpfulLink.find(params[:id]) 
		@user = User.find(params[:user_id]) 
		if @link.update_attributes(link_params)
			flash[:notice] = "Link Updated. Thank you #{current_user.username}!"
			redirect_to root_url
		else
			flash[:alert] = "Could not update..."
			redirect_to root_url
		end
	end

	def destroy
		@link.destroy
		respond_to do |format|
			format.html { redirect_to root_url }
			format.json { head :no_content }
		end
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def link_params
		params.require(:helpful_link).permit(:name, :description, :link, :user_id, :paid)
	end


end
