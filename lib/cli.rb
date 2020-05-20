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
    scraper.scrape_more_info(coffee)
    display_coffee_info(coffee)
  end

  def welcome
    puts "Hello coffee lover!".colorize(:light_blue)
    sleep(1)
    first_input
  end

  def first_input
    puts "Please choose a coffee between 1-15!".colorize(:light_blue)
    sleep(1)
  end

  def valid_input?(input)
    if input >= 1 && input <= 15
      true
    else
      puts "Invalid choice, please pick a number bewteen 1-15!".colorize(:red)
      call
    end
  end

  def coffee_list
    Coffee.all.each do |coffee|
      puts "#{coffee.id}. #{coffee.name}"
    end
  end

  def praise
    puts "Great choice!".colorize(:light_blue)
    sleep(1)
  end

  def lookup_coffee_by_id(input)
    Coffee.find_by_id(input)
  end

  def display_coffee_info(coffee)
    puts "You selected #{coffee.name}. Here is some info:".colorize(:green)
    sleep(1)
    puts coffee.bio.to_s
    sleep(1)
    puts "Here are the ingredients needed to make this coffee:".colorize(:green)
    sleep(1)
    puts coffee.ingredients.to_s
    sleep(1)
    puts "Here are the instructions to make this coffee:".colorize(:green)
    sleep(1)
    puts coffee.steps.to_s
    continue
  end

  def continue
    puts "Would you like to pick another coffee?".colorize(:light_blue)
    sleep(1)
    puts "Please type 'yes' or 'no'".colorize(:light_blue)
    choose_again
  end

  def choose_again
    input = gets.strip
    if input == "yes"
      call
    elsif input == "no"
      exit_commands
      sleep(1)
    else
      puts "Invalid command, please type 'yes' or 'no'".colorize(:red)
      continue
    end
  end

  def exit_commands
    puts "It has been a pleasure to learn about coffee with you!".colorize(:light_blue)
    sleep(1)
    puts "Make sure to keep coming back until you've tried all 15 coffees!".colorize(:light_blue)
  end
end