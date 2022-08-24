Unsplash.configure do |config|
  config.application_access_key = ENV.fetch["UNSPLASH_ACCES_KEY"]
  config.application_secret = ENV.fetch["UNSPLASH_SECRET_KEY"]
  config.application_redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
  config.utm_source = "rent-a-rentner"
end
