# This class is responsible for communication with the user.
# This is where i will use puts a lot
# This will never use nokogiri
# This will invoke the scaper class

class Cli

  def call
    scraper = Scraper.new
    scraper.get_coffee
    scraper.scrape_coffee
    welcome
    first_input
    coffee_list

    input = gets.strip.to_i
    valid_input?(input)

    praise

    coffee = lookup_coffee_by_name(input)

    #show the user the coffee bio

  end

  def welcome
    puts "Hello coffee lover!"
    sleep(1)
  end

  def first_input
    puts "Please choose a coffee between 1-15!"
    sleep(1)
  end

  def valid_input?(input)
    if input >= 1 && input <= 15
      true
    else
      puts "Invalid choice, please pick a number bewteen 1-15!"
      call
    end
  end

  def coffee_list
    Scraper.new.get_coffee
    Coffee.all.each.with_index(1) do |coffee, i|
      puts "#{i}. #{coffee.name}"
    end
  end

  def praise
    puts "Great choice!"
    sleep(1)
    puts "Here is some information on that coffee!"
  end

  def lookup_coffee_by_name(input)
    Coffee.find_by_name(input)
  end

end