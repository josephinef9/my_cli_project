class Interface
  class << self
    SLEEP_TIME = 1
    def welcome
      puts_blue "Hello coffee lover!".bold
    end

    def first_input
      puts_blue "Please choose a coffee between 1-15!".bold
      sleep(SLEEP_TIME)
    end

    def praise
      puts_blue "Great choice!".bold
      sleep(SLEEP_TIME)
    end

    def keep_learning
      puts_blue "Would you like to learn more about this coffee?".bold
      sleep(SLEEP_TIME)
      puts_blue "Type 'yes' to learn more.".bold
      sleep(SLEEP_TIME)
      puts_blue "Type 'no' to pick another coffee".bold
      sleep(SLEEP_TIME)
      puts_blue "Type 'exit' to leave the program".bold
    end

    def exit_commands
      puts ""
      puts_blue "It's been so fun to learn about coffee with you!".bold
      sleep(SLEEP_TIME)
      puts_blue "Keep coming back until you've tried all 15 coffees!".bold
      exit
    end

    def puts_blue(string)
      puts string.colorize(:light_blue)
    end

    def puts_green(string)
      puts string.colorize(:green)
    end

    def puts_red(string)
      puts string.colorize(:red)
    end

    def continue
      puts_blue "Would you like to pick another coffee?".bold
      sleep(SLEEP_TIME)
      puts_blue "Please type 'yes' to pick another coffee".bold
      sleep(SLEEP_TIME)
      puts_blue "Please type 'no' to exit the program".bold
      choose_again
    end

    def choose_again
      input = gets.strip
      return false if input == "yes"

      if input == "no"
        exit_commands
      else
        puts_red "Invalid command, please type 'yes' or 'no'".bold
        continue
      end
    end
  end
end
