class Url < ApplicationRecord
  scope :top_100, -> { order(total_access: :desc).limit(100) }

  validates :original, presence: true
  validates :original, url: true

  after_create do
    self.short = CreateShortUrlService.new(self.id).call
    self.save!
    TitleParserJob.perform_async(self.id)
  end
end
