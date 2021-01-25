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

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

  def new_meal(customer, total, tip=0)
    Meal.new(customer, self, total, tip)
  end

  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(customer, self, total, tip)
  end

  def self.oldest_waiter
    oldest_age = 0
    oldest_waiter = nil
    self.all.each do |waiter|
      if waiter.age > oldest_age
        oldest_age = waiter.age
        oldest_waiter = waiter
      end
    end
    oldest_waiter
  end

end