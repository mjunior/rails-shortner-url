class Url < ApplicationRecord
  scope :top_100, -> { order(total_access: :desc).limit(100) }

  validates :original, presence: true
  validates :original, url: true

  after_create do
    short_url = "#{Rails.configuration.base_application_domain}#{CreateShortUrlService.new(self.id).call}"
    self.short = short_url
    self.save!
    TitleParserJob.perform_async(self.id)
  end
end
