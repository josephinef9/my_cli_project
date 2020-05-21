class Cli
  attr_reader :scraper, :coffee

  SLEEP_TIME = 0

  def call
    @scraper = Scraper.new
    scraper.coffee_names
    welcome
    next_call
  end

  def next_call
    first_input
    coffee_list

    input = gets.strip.to_i
    valid_input?(input)

    praise

    coffee = lookup_coffee_by_id(input)
    GoogleScraper.new(coffee)
    scraper.scrape_coffee(coffee)
    scraper.scrape_more_info(coffee)
    display_coffee_info(coffee)
  end

  def welcome
    puts_blue "Hello coffee lover!"
    sleep(SLEEP_TIME)
  end

  def first_input
    puts_blue "Please choose a coffee between 1-15!"
    sleep(SLEEP_TIME)
  end

  def valid_input?(input)
    if input >= 1 && input <= 15
      true
    else
      puts "Invalid choice, please pick a number bewteen 1-15!".colorize(:red)
      next_call
    end
  end

  def coffee_list
    Coffee.all.each do |coffee|
      puts "#{coffee.id}. #{coffee.name}"
    end
  end

  def praise
    puts_blue "Great choice!"
    sleep(1)
  end

  def lookup_coffee_by_id(input)
    Coffee.find_by_id(input)
  end

  def display_coffee_info(coffee)
    coffee_name(coffee)
    puts coffee.bio
    sleep(SLEEP_TIME)
    coffee_ingredients(coffee)
    sleep(SLEEP_TIME)
    coffee_instructions(coffee)
    sleep(SLEEP_TIME)
    GoogleScraper.new(coffee).more_info
    continue
  end

  def coffee_name(coffee)
    puts "You selected #{coffee.name}. Here is some info:".colorize(:green)
    sleep(SLEEP_TIME)
  end

  def coffee_ingredients(coffee)
    puts "Here are the ingredients needed to make this coffee:".colorize(:green)
    sleep(SLEEP_TIME)
    puts coffee.ingredients
  end

  def coffee_instructions(coffee)
    puts "Here are the instructions to make this coffee:".colorize(:green)
    sleep(SLEEP_TIME)
    puts coffee.steps
    puts ""
  end

  def continue
    puts_blue "Would you like to pick another coffee?"
    sleep(SLEEP_TIME)
    puts_blue "Please type 'yes' to pick another coffee"
    puts_blue "Please type 'no' to exit the program"
    choose_again
  end

  def choose_again
    input = gets.strip
    if input == "yes"
      next_call
    elsif input == "no"
      exit_commands
      sleep(SLEEP_TIME)
    else
      puts "Invalid command, please type 'yes' or 'no'".colorize(:red)
      continue
    end
  end

  def exit_commands
    puts_blue "It's been so fun to learn about coffee with you!"
    sleep(SLEEP_TIME)
    puts_blue "Keep coming back until you've tried all 15 coffees!"
    exit
  end

  def puts_blue(string)
    puts string.colorize(:light_blue)
  end
end
