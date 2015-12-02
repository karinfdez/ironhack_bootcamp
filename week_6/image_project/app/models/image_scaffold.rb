class ImageScaffold < ActiveRecord::Base
	
	#Here I add this line with the uploader class
    mount_uploader :image, ImageUploaderUploader
end
