# This is responsible for scrapping my webpage
# This file will use nokogiri
# This file will never use puts

class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get("https://www.cafepoint.co.uk/different-types-of-coffee/"))
    binding.pry
  end

  # def get_coffees
  #   # doc.css(".nav").each do |coffee_info|
  #   #   binding.pry
  #   #  coffee_info.css(".nav").first.css("a").first.text.split(" ")[0]

  #   # end
  # end

end



# doc.css(".nav").first.css("a").first.text.split(" ")[0] - list of 15 coffees
# doc.css(".instructions").first.children[4].text - ingredients
# doc.css(".steps").first.text.delete("\n").delete("\u2019").delete("\u2013") - instructions