class Concertnet < ActiveRecord::Base
	
	validates :artist,presence: true
	validates :venue,presence: true
	validates :city,presence: true
	validates :date, presence: true
	validates :price,numericality: true

	has_many :comments
end
