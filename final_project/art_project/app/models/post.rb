# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  image      :string
#  user_id    :integer
#  author     :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base

	mount_uploader :image, ImageUploader
	belongs_to :user

	validates :title,:content, presence: true
	validates :title, length: { in: 2..80 },uniqueness: true
	has_many :comments

end
