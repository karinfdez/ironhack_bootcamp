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

	mount_uploader :image,ImageUploader
	# belongs_to :user

	validates :title,:author,:content, presence: true
	validates :title, length: { in: 2..80 },uniqueness: true

	# def user_can_edit?(user_id)
 #    # if the post's owner is the same as the user id passed..
 #    if self.user_id == user_id
 #      true
 #    else
 #      false
 #    end
 #  end

end
