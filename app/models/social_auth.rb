class SocialAuth < ApplicationRecord
  belongs_to :user

  scope :wiht_provider_and_uid, ->(provider, uid) { where(provider: provider).where(uid: uid) }
end
