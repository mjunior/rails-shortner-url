require 'uri'
class Url < ApplicationRecord
  validates :original, :short, presence: true
  validates :original, url: true
end
