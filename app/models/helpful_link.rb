class HelpfulLink < ActiveRecord::Base
    belongs_to :user
    belongs_to :favourite
    after_create :send_notification

    def send_notification
		AdminMailer.new_resource(self).deliver_now
	end
end
