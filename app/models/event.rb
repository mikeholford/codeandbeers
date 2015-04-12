class Event < ActiveRecord::Base
	scope :future, lambda { where("date >= ?", Date.today ) }
	scope :past, lambda { where("date < ?", Date.today ) }
end
