class GoogleScrape
  attr_accessor :page

  def initialize
    @page = Nokogiri::HTML(HTTParty.get(
      "https://www.google.com/search?q=#{coffee.slug}"
    ).body)
  end
end
