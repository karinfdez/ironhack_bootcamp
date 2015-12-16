class Comment < ActiveRecord::Base
	belongs_to :concertnet
	belongs_to :user
end
