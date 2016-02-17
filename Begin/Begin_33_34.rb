#33) X kg of sweet cost A euro. Find the cost of 1 kg and Y kg of the sweets (positive numbers X, A, Y are given).
#34) X kg of chocolates cost A euro and Y kg of sugar candies cost B euro (positive numbers X, A, Y, B are given).
# Find the cost of 1 kg of the chocolates and the cost of 1 kg of the sugar candies.
# Also determine how many times the chocolates are more expensive than the sugar candies.

module CostCounting
  def price_1_kg(amount, cost)
    cost / amount
  end
end

class CostSweet
  include CostCounting
  attr_reader :other_amount

  def initialize(amount, cost, other_amount)
    @amount = amount.to_f
    @cost = cost.to_f
    @other_amount = other_amount.to_f
  end

  def price_1_kg_sweet
    @price = price_1_kg(@amount, @cost)
  end

  def cost_x_kg
    @other_amount * @price
  end
end

class Purchases
  include CostCounting

  def initialize
    @basket = Hash.new
  end

  def add_buying(name, amount, cost)
    @basket[name] = [amount.to_f, cost.to_f]
  end

  def price_1_kg_of_buying(name)
    price_1_kg(@basket[name].first, @basket[name].last)
  end
end

my_purchase = CostSweet.new(3, 59, 8)
puts "1 kg of sween costing is a #{my_purchase.price_1_kg_sweet.round(2)}"
puts "#{my_purchase.other_amount} kg of sweet costing is a #{my_purchase.cost_x_kg.round(2)}"

my_purchases = Purchases.new
my_purchases.add_buying("chocolates", 3, 52)
puts "1 kg chocolates cost is #{my_purchases.price_1_kg_of_buing("chocolates").round(2)}"
my_purchases.add_buying("sugar candies", 7, 33)
puts "1 kg sugar candies cost is #{my_purchases.price_1_kg_of_buing("sugar candies").round(2)}"