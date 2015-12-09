class ImageGallery < ActiveRecord::Base
	mount_uploaders :picture, ImageUploader
end
