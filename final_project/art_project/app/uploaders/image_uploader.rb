# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # version :thumb do
  #   process resize_to_fit: [50,40]
  # end

  # version :thumb2 do
  #   process resize_to_fit: [70,70]
  # end

  process :convert => 'png'
  
  
  version :thumb do
    process :resize_to_limit => [50, 50]
  end
  version :small do
    process :resize_to_limit => [100, 100]
  end
end
