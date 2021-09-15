class ValidationFileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    return "ISSUES/" + "#{model.id}"
  end 

  def extension_allowlist
     %w(pdf)
  end
end
