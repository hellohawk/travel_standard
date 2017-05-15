# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: ENV['AKIAJLUZR4QJKXNMJR3Q'],
#     aws_secret_access_key: ENV['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'],
#     region: 'us-west-2'
#   }

#     case Rails.env
#     when 'development'
#         config.fog_directory  = 'hatorip'
#         config.asset_host = 'https://s3-us-west-2.amazonaws.com/hatorip'
#     when 'production'
#         config.fog_directory  = 'hatorip'
#         config.asset_host = 'https://s3-us-west-2.amazonaws.com/hatorip'
#     end
# end