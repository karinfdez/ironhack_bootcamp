# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  title          :string
#  location       :string
#  start_date     :datetime
#  ends_date      :datetime
#  image          :string
#  description    :string
#  organizer_name :string
#  event_type     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Event < ActiveRecord::Base
	#Events validations
	validates :title,:location,:description, :organizer_name,:event_type,presence: true
	validates :title,:organizer_name,length: { minimum: 1 }

  #Includes the ImageUploader class
	mount_uploader :image,ImageUploader
end
