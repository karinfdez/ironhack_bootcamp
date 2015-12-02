class Event < ActiveRecord::Base
	#Events validations
	validates :title,:location,:description, :organizer_name,:event_type,presence: true
	validates :title,:organizer_name,length: { minimum: 1 }
end
