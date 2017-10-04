class InnImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :for_index do
    process resize_to_fit: [150, 150]
  end

  version :for_show do
    process resize_to_fit: [250, 250]
  end

  def default_url(*args)
    ActionController::Base.helpers.image_path([version_name, "inn_default.jpg"].compact.join('_'))
  end

end
