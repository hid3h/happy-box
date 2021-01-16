class HappinessCard < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: {minimum: 1, maximum: 100}

  scope :recently, -> { order(id: 'DESC') }
  scope :by_user, ->(user) { where(user: user) }

  class << self
    def add(user:, message:)
      create!(
        user:    user,
        message: message
      )
    end

    def count_by_month(user:)
      # とりあえず今年のものだけとる
      this_year = Time.zone.now.year # integerです
      # TODO 今年にしぼる
      group("MONTH(created_at)").by_user(user).count
    end
  end
end
