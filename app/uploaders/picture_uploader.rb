class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  
  version :standard do 
      process resize_to_fill: [300,300, :north]
  end
  
  version :thumb do
      process resize_to_fit: [50,50]
  end
  
  

end
