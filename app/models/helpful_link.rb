class HelpfulLink < ActiveRecord::Base
    
    # Associations
    belongs_to :user
    has_many :favourites
    has_many :collections, :through => :collection_links
	has_many :collection_links
    
    after_create :send_notification

    def send_notification
		AdminMailer.new_resource(self).deliver_now
	end
end
