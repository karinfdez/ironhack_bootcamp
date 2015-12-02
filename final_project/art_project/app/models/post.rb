class Post < ActiveRecord::Base

mount_uploader :image,ImagePostUploader
belongs_to :user
end
