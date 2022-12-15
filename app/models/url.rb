class Url < ApplicationRecord
  validates :original, :short, presence: true
end
