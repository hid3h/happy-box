Rails.application.config.middleware.use OmniAuth::Builder do
  p "ここちゃんと入ってるか", Rails.application.credentials.twitter[:api_key], Rails.application.credentials.twitter[:api_secret]
  provider :twitter, Rails.application.credentials.twitter[:api_key], Rails.application.credentials.twitter[:api_secret]
end
