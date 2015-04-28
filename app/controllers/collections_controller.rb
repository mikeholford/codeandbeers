class CollectionsController < ApplicationController

	def index 
		@collections = Collection.all
	end

	def show 
		@clink = CollectionLink.new
		@collection = Collection.find(params[:id])
		@collection_links = CollectionLink.where(collection_id: @collection.id)
	end

end
