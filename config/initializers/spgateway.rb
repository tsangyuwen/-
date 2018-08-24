require 'spgateway'
Spgateway.merchant_id = ENV["merchant_id"]
Spgateway.hash_key = ENV["hash_key"]
Spgateway.hash_iv = ENV["hash_iv"]
Spgateway.url = ENV["url"]
Spgateway.notify_url = ENV["notify_url"]
