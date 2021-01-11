Rails.application.config.middleware.use OmniAuth::Builder do
  p "ここちゃんと入ってるか", ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
end
