class Waiter
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def new_meal(customer, total, tip=0)
    Meal.new(customer, self, total, tip)
  end
end
