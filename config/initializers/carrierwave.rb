if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # 自動的にuploaderを読み込む
  # UserImageUploader

  # http://icebergist.com/posts/rspec-and-factorygirl-setup-for-testing-carrierwave-uploaders/
end
