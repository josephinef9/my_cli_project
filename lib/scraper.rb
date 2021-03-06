class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get(
      "https://www.cafepoint.co.uk/different-types-of-coffee/"
    ).body)
  end

  def coffee_names
    doc.css("#nav li").each do |coffee_info|
      Coffee.new(
        name: coffee_info.text.delete("\n").tr("\u00C9", "E").strip
      )
    end
  end

  def scrape_coffee(coffee)
    doc.css("section##{coffee.slug} p.instructions").each do |coffee_info|
      coffee.bio = coffee_info.next_element.text
      coffee.ingredients = coffee_info.children[4].text.strip
    end
  end

  def scrape_more_info(coffee)
    doc.css("section##{coffee.slug} ul.steps").each do |coffee_info|
      coffee.steps = coffee_info.children.text.delete("\n").split("Step")
    end
  end
end
