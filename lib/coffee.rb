# This is responsible for the blueprint of a Coffee
# This will never use nokogiri
# This will never use puts
# Store all of my Coffee instance data(attributes), or anything else I need it to do

class Coffee
  attr_accessor :name, :bio, :ingredients, :instructions

  @@all = []

  def initialize(name:)
    @name = name
    # @bio = bio
    # @ingredints = ingredients
    # @instructions = instructions
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.find do |coffee|
      coffee.name == name
    end
  end

end