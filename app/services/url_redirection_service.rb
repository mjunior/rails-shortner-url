class UrlRedirectionService
  def initialize(short)
    @short = short
  end

  def call
    url = Url.find_by!(short: @short)
    url.increment!(:total_access)
    url.original
  end
end