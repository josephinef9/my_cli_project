class Cli
  attr_reader :scraper, :coffee
  attr_writer :coffee

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

    self.coffee = lookup_coffee_by_id(input)
    GoogleScraper.new(coffee)
    scraper.scrape_coffee(coffee)
    scraper.scrape_more_info(coffee)
    display_coffee_info
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

  def display_coffee_info
    coffee_name
    puts coffee.bio
    sleep(SLEEP_TIME)
    coffee_ingredients
    sleep(SLEEP_TIME)
    coffee_instructions
    sleep(SLEEP_TIME)
    # GoogleScraper.new(coffee).more_info
    keep_learning
    valid?
  end

  def coffee_name
    puts "You selected #{coffee.name}. Here is some info:".colorize(:green)
    sleep(SLEEP_TIME)
  end

  def coffee_ingredients
    puts "Here are the ingredients needed to make this coffee:".colorize(:green)
    sleep(SLEEP_TIME)
    puts coffee.ingredients
  end

  def coffee_instructions
    puts "Here are the instructions to make this coffee:".colorize(:green)
    sleep(SLEEP_TIME)
    puts coffee.steps
    puts ""
  end

  # def continue
  #   puts_blue "Would you like to pick another coffee?"
  #   sleep(SLEEP_TIME)
  #   puts_blue "Please type 'yes' to pick another coffee"
  #   puts_blue "Please type 'no' to exit the program"
  #   choose_again
  # end

  def exit_commands
    puts_blue "It's been so fun to learn about coffee with you!"
    sleep(SLEEP_TIME)
    puts_blue "Keep coming back until you've tried all 15 coffees!"
    exit
  end

  def puts_blue(string)
    puts string.colorize(:light_blue)
  end

  def keep_learning
    puts_blue "Would you like to learn more about this coffee?"
    puts_blue "Type 'yes' to learn more."
    puts_blue "Type 'no' to pick another coffee"
    puts_blue "Type 'exit' to leave the program"
  end

  def valid?
    input = gets.strip
    if input == "yes"
      GoogleScraper.new(coffee).more_info
      puts coffee.additional_info
      puts_blue "Thanks for learning with me!"
    elsif input == "no"
      next_call
    elsif input == "exit"
      exit_commands
    else
      puts "Invalid command, please type 'yes', 'no' or 'exit'".colorize(:red)
      keep_learning
      valid?
    end
  end

end
