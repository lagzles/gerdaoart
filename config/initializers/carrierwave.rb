
CarrierWave.configure do |config|
  config.storage    = :aws
  config.region     = 'us-east-1'
  config.aws_bucket = ENV['AMAZON_BUCKET_NAME']
  config.aws_acl    = :public_read
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     ENV['AMAZON_KEY_ID'],
    secret_access_key: ENV['AMAZON_ACCESS_KEY']
    region:            ENV['AMAZON_REGION']
  }
end

#   CarrierWave.configure do |config|
#
#   # Use local storage if in development or test
#   if Rails.env.development? || Rails.env.test?
#     CarrierWave.configure do |config|
#       config.storage = :file
#     end
#   end
#
#   # Use AWS storage if in production
#   if Rails.env.production?
#     CarrierWave.configure do |config|
#       config.storage = :fog
#     end
#   end
#
#   config.fog_credentials = {
#     :provider               => 'AWS',                             # required
#     :aws_access_key_id      => ENV['AMAZON_KEY_ID'],            # required
#     :aws_secret_access_key  => ENV['AMAZON_ACCESS_KEY'],     # required
#     :region                 => ENV['AMAZON_REGION']                        # optional, defaults to 'us-east-1'
#   }
#   config.fog_directory  = ENV['AMAZON_BUCKET_NAME']               # required
#   #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
#   config.fog_public     = false                                  # optional, defaults to true
#   config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
# end
