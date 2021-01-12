class SocialAuth < ApplicationRecord
  belongs_to :user

  scoep: wiht_provider_and_uid, ->(provider, uid) { where(provider: provider).and(uid: uid) }
end
