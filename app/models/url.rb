class Url < ApplicationRecord
  scope :top_100, -> { order(total_access: :desc).limit(100) }

  validates :original, :short, presence: true
  validates :original, url: true
end
