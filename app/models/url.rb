class Url < ApplicationRecord
  validates :original, :short, presence: true

  # TODO: add validation original is a valid url
end
