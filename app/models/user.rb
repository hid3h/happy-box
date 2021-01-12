class User < ApplicationRecord
  has_many :social_auths

  scope: auth_with_provider_and_uid, -> { joins(:social_auths).merge(SocialAuth.wiht_provider_and_uid(provider, uid)) }

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      provider    = auth_hash[:provider]
      uid         = auth_hash[:uid]
      screen_name = auth_hash[:info][:nickname]
      name        = auth_hash[:info][:name]
      image_url   = auth_hash[:info][:image]

      user = User.auth_with_provider_and_uid(provider, uid)
      p user
      if user.nil?
        # TODO 作成
      else
        # TODO トークン系を更新
      end
      
      return user
    end
  end
end
