class Cli
  attr_reader :scraper, :coffee
  attr_writer :coffee

  SLEEP_TIME = 1

  def call
    @scraper = Scraper.new
    scraper.coffee_names
    Interface.welcome
    sleep(SLEEP_TIME)
    next_call
  end

  def next_call
    Interface.first_input
    sleep(SLEEP_TIME)
    coffee_list

    input = gets.strip.to_i
    valid_input?(input)

    Interface.praise

    self.coffee = lookup_coffee_by_id(input)
    scrape_coffees
    display_coffee_info
  end

  def scrape_coffees
    GoogleScraper.new(coffee)
    scraper.scrape_coffee(coffee)
    scraper.scrape_more_info(coffee)
  end

  def valid_input?(input)
    if input >= 1 && input <= 15
      true
    else
      Interface.puts_red "Invalid choice, pick a number bewteen 1-15!".bold
      next_call
    end
  end

  def coffee_list
    Coffee.all.each do |coffee|
      puts "#{coffee.id}. #{coffee.name}"
    end
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
    Interface.keep_learning
    valid?
  end

  def coffee_name
    Interface.puts_green "You selected #{coffee.name}. Here is some info:".bold
    sleep(SLEEP_TIME)
  end

  def coffee_ingredients
    Interface.puts_green "Here are the ingredients needed for this coffee:".bold
    sleep(SLEEP_TIME)
    puts coffee.ingredients
  end

  def coffee_instructions
    Interface.puts_green "Here are the instructions to make this coffee:".bold
    sleep(SLEEP_TIME)
    puts coffee.steps
    puts ""
  end

  def valid?
    input = gets.strip
    if input == "yes"
      second_choice
    elsif input == "no" then next_call
    elsif input == "exit" then Interface.exit_commands
    else
      Interface.puts_red "Invalid command, type 'yes', 'no' or 'exit'".bold
      Interface.keep_learning
      valid?
    end
  end

  def google_info
    puts ""
    Interface.puts_blue "Here is what Google has to say about this coffee:"
    GoogleScraper.new(coffee).more_info
    if coffee.additional_info.any?
      puts coffee.additional_info
    else
      puts "\nSorry Google doesn't like this coffee"
      puts "This coffee must not be too good"
      puts ""
    end
  end

  def second_choice
    google_info
    puts ""
    next_call if Interface.continue == false
    Interface.choose_again
  end
end
