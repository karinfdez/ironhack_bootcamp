class Event < ActiveRecord::Base
	#Events validations
	validates :title,:location,:description, :organizer_name,:event_type,presence: true
	validates :title, length: { minimum: 1 }
end
