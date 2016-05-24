CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['IMG_UP_AWS_S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['IMG_UP_AWS_S3_SECRET_ACCESS_KEY'],
      region:                'ap-northeast-1'
  }
  config.cache_storage = :fog

  case Rails.env
    when 'production'
      config.fog_directory = 'guestbook-image'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/guestbook-image'
    when 'staging'
      config.fog_directory = 'stg-guestbook-image'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/stg-guestbook-image'
    when 'development'
      config.fog_directory = 'dev-guestbook-image'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev-guestbook-image'
    when 'test'
      config.fog_directory = 'test-guestbook-image'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test-guestbook-image'
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
