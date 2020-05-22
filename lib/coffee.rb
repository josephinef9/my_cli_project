class Coffee
  attr_accessor :bio, :ingredients, :steps, :additional_info
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

  def slug
    name.tr(" ", "-")
  end
end
