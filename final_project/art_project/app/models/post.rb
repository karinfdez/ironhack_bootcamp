class Post < ActiveRecord::Base

mount_uploader :image,ImagePostUploader
belongs_to :user

validates :title,:author,:content, presence: true
validates :title, length: { in: 2..80 },uniqueness: true

end
