class GoogleScraper
  attr_accessor :page, :coffee

  def initialize(coffee)
    @page = Nokogiri::HTML(HTTParty.get(
      "https://www.google.com/search?q=#{coffee.slug}"
    ).body)
  end

  def slug
    name.tr(" ", "-")
  end

  def more_info
    additional_info = page.css("#main .ZINbbc .vbShOe").text
    puts additional_info
  end
end
