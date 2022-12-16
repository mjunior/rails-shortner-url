class UrlRedirectionService
  def initialize(short)
    @short = short
  end

  def call
    url = Url.find_by!(short: "#{Rails.configuration.base_application_domain}#{@short}")
    url.increment!(:total_access)
    url.original
  end
end