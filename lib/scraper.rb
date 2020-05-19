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
        name: coffee_info.text.delete("\n").delete(" ").delete("\u00C9")
      )
    end
  end

  # doc.css(".container") - page
# doc.css(".nav").first.css("a").first.text.split(" ")[0] - list of 15 coffees
# doc.css(".instructions").first.children[4].text - ingredients
# doc.css(".steps").first.text.delete("\n").delete("\u2019").delete("\u2013") - instructions

end


# doc.css(".nav").first.css("a").map do |coffee|
#   coffee.text.delete("\n").delete("\u00c9")
# end

# doc.css(".instructions").map do |ingredients|
#   ingredients.children[4].text
# end

# doc.css(".steps").map do |instructions|
#   instructions.text.delete("\n").delete("\u2019").delete("\u2013").delete("\t").delete("\u00E9").delete("\u00BD")
# end


# doc.css("#FRAPPUCCINO").first.css("p")[1].text.gsub("\u2019", "'") - bio