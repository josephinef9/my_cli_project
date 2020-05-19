# This class is responsible for communication with the user.
# This is where i will use puts a lot
# This will never use nokogiri
# This will invoke the scaper class

class Cli

  def call
    scraper = Scraper.new
    scraper.get_coffee
    welcome
    first_input
    coffee_list

    input = gets.strip.to_i
    valid_input?(input)

    praise

    coffee = lookup_coffee_by_id(input)
    scraper.scrape_coffee(coffee)
    puts coffee.bio

    continue

    input1 = gets.strip

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
      gets.strip
    end
  end

  def coffee_list
    Coffee.all.each do |coffee|
      puts "#{coffee.id}. #{coffee.name}"
    end
  end

  def praise
    puts "Great choice!"
    sleep(1)
    puts "Here is some information on that coffee!"
  end

  def lookup_coffee_by_id(input)
    Coffee.find_by_id(input)
  end

  def continue
    puts "Would you like some more information on this coffee?"
    puts "Please type yes or no!"
  end

end