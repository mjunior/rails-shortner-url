class TitleParserJob
  include Sidekiq::Job

  def perform(url_id)
    UpdateTitleService.new(url_id).call
  end
end
