class HappinessCard < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: {minimum: 1, maximum: 100}

  scope :recently, -> { order(id: 'DESC') }

  class << self
    def add(user:, message:)
      create!(
        user:    user,
        message: message
      )
    end
  end
end
