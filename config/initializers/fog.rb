# /config/initializers/fog.rb
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJF53EH3IAMMK4IOQ',
    :aws_secret_access_key  => '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'
    #:region                 => 'eu-west-1'
  }

  #Required for Heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  if Rails.env == "staging"
    config.fog_directory  = 'econify-development'
  elsif Rails.env == "production"
    config.fog_directory  = 'econify-development'
  else
    config.fog_directory  = 'econify-development'
  end

end
