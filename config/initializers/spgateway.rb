require 'spgateway'
Spgateway.merchant_id = CONFIG.MERCHANT_ID
Spgateway.hash_key = CONFIG.HASH_KEY
Spgateway.hash_iv = CONFIG.HASH_IV
Spgateway.url = CONFIG.URL
Spgateway.notify_url = CONFIG.NOTIFY_URL
