# This class is responsible for communication with the user.
# This is where i will use puts a lot
# This will never use nokogiri
# This will invoke the scaper class

class Cli

  def call
    scraper = Scraper.new
    scraper.get_coffee
    welcome
    coffee_list

    input = gets.strip.to_i
    valid_input?(input)

    praise

    coffee = lookup_coffee_by_id(input)
    scraper.scrape_coffee(coffee)
    display_coffee_info(coffee)
  end

  def welcome
    puts "Hello coffee lover!"
    sleep(1)
    first_input
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
    Coffee.all.each do |coffee|
      puts "#{coffee.id}. #{coffee.name}"
    end
  end

  def praise
    puts "Great choice!"
    sleep(1)
  end

  def lookup_coffee_by_id(input)
    Coffee.find_by_id(input)
  end

  def display_coffee_info(coffee)
    puts "You have selected #{coffee.name}. Here is some information on that coffee!"
    sleep(1)
    puts "#{coffee.bio}"
    sleep(1)
    puts "Here are the ingredients needed to make this coffee:"
    sleep(1)
    puts "#{coffee.ingredients}"
  end

end