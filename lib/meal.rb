class Meal
  @@all = []
  def initialize(customer, waiter, total, tip = 0)
    @customer = customer
    @waiter = waiter
    @total = total
    @tip = tip
    @@all << this
  end

  def self.all
    @@all
  end
end
