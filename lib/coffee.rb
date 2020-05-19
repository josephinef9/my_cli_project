# This is responsible for the blueprint of a Coffee
# This will never use nokogiri
# This will never use puts
# Store all of my Coffee instance data(attributes), or anything else I need it to do

class Coffee
  attr_accessor :bio
  attr_reader :name, :id

  @@all = []

  def initialize(name:)
    @name = name
    @@all << self
    @id = @@all.count
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    all.find do |coffee|
      coffee.id == id
    end
  end

end