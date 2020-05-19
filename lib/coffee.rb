# This is responsible for the blueprint of a Coffee
# This will never use nokogiri
# This will never use puts
# Store all of my Coffee instance data(attributes), or anything else I need it to do

class Coffee
  attr_accessor :name, :ingredients, :instructions

  @@all = []

  def initialize(name:)
    @name = name
    # @ingredints = ingredients
    # @instructions = instructions
    @@all << self
  end

  def self.all
    @@all
  end

end