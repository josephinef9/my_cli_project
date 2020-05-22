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
    additional_info = page.css("#main .ZINbbc .vbShOe").children.map do |el|
      el.text
    end
    coffee.additional_info = additional_info
  end
end
