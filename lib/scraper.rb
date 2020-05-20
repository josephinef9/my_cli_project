# This is responsible for scrapping my webpage
# This file will use nokogiri
# This file will never use puts

class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get("https://www.cafepoint.co.uk/different-types-of-coffee/").body)
  end

  def get_coffee
    doc.css("#nav li").each do |coffee_info|
      Coffee.new(
        name: coffee_info.text.delete("\n").gsub("\u00C9", "E").strip
      )
    end
  end

  def scrape_coffee(coffee)
    name = coffee.name.gsub(" ", "-")
    doc.css("section##{name} p.instructions").each do |coffee_info|
    binding.pry
      coffee.bio = coffee_info.next_element.text
      coffee.ingredients = coffee_info.children[4].text.strip
    end
  end

end

# doc.css(".steps").map do |instructions|
#   instructions.text.delete("\n").delete("\u2019").delete("\u2013").delete("\t").delete("\u00E9").delete("\u00BD")
# end