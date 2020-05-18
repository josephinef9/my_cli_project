# This class is responsible for communication with the user.
# This is where i will use puts a lot
# This will never use nokogiri
# This will invoke the scaper class

class Cli

  def call
    welcome
    #should list coffees 1-15
    first_input

    input = gets.strip.to_i
    valid_input?(input)

    #going to need a find coffee by name method in Coffee? that takes the users input and finds that coffee

    #then we want to display that coffees info

  end

  def welcome
    puts "Hello coffee lover!"
  end

  def first_input
    puts "Please choose a coffee between 1-15!"
  end

  def valid_input?(input)
    if input >= 1 && input <= 15
      true
    else
      puts "Invalid choice, please pick a number bewteen 1-15!"
      call
    end
  end

end