class User < ApplicationRecord
  has_many :social_auths
  has_many :happiness_cards

  scope :auth_with_provider_and_uid, ->(provider, uid) { joins(:social_auths).merge(SocialAuth.wiht_provider_and_uid(provider, uid)) }

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      provider    = auth_hash[:provider]
      uid         = auth_hash[:uid]
      screen_name = auth_hash[:info][:nickname]
      name        = auth_hash[:info][:name]
      image_url   = auth_hash[:info][:image]

      user = User.auth_with_provider_and_uid(provider, uid).take

      if user.nil?
        transaction do
          user = User.create(
            screen_name:       screen_name,
            name:              name,
            profile_image_url: image_url
          )
          user.social_auths.create(
            provider:     provider,
            uid:          uid,
            access_token: auth_hash[:credentials][:token],
            secret:       auth_hash[:credentials][:secret]
          )
        end
      else
        # TODO トークン系を更新
      end
      
      return user
    end
  end
end
