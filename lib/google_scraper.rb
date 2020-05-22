class GoogleScraper
  attr_reader :page, :coffee

  def initialize(coffee)
    @page = Nokogiri::HTML(HTTParty.get(
      "https://www.google.com/search?q=#{coffee.slug}"
    ).body)
    @coffee = coffee
  end

  def slug
    name.tr(" ", "-")
  end

  def more_info
    info = page.css("#main .ZINbbc .vbShOe").children.map(&:text)
    coffee.additional_info = info
  end
end
