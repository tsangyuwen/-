Recaptcha.configure do |config|
  config.site_key  = ENV["re_site_key"]
  config.secret_key = ENV["re_secret_key"]
end