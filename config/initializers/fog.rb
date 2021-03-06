# /config/initializers/fog.rb
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["SECRET_ACCESS_KEY"]
    #:region                 => 'eu-west-1'
  }

  #Required for Heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  if Rails.env == "staging"
    config.fog_directory  = 'stagereads-development'
  elsif Rails.env == "production"
    config.fog_directory  = 'stagereads-production'
  else
    config.fog_directory  = 'stagereads-development'
  end

end
