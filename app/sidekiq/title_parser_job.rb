class TitleParserJob
  include Sidekiq::Job
  sidekiq_options retry: 3
  
  def perform(url_id)
    UpdateTitleService.new(url_id).call
  end
end
