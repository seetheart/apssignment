require 'active_support/core_ext/hash/indifferent_access'
require_relative './cart'
require_relative './user'
require_relative './calculate_bill'

PRICE_TABLE = {
  milk: {
    unit_price: 3.97,
    sale_price: 5,
    sale_count: 2
  },
  banana: {
    unit_price: 0.99,
    sale_price: nil,
    sale_count: nil
  },
  bread:  {
    unit_price: 2.17,
    sale_price: 6,
    sale_count: 3
  },
  apple:  {
    unit_price: 0.89,
    sale_price: nil,
    sale_count: nil
  }
}.with_indifferent_access.freeze

cart = Cart.new # Initializing a cart
user = User.new(cart) # Initializing a user

puts "Please enter all the items purchased separated by a comma:"

user_input = gets.chomp.split(",").map(&:strip) # Make an array of the items picked up by the customer

user_input.each { |item| user.add_to_cart(item) } # Add to cart by customer

calc = CalculateTotalBill.new(cart) # calculator class
discounted_calc = DiscountedBill.new(cart) # discounted calculator class

puts "\n"
puts "Item               Qquantity             Price"
puts "-----------------------------------------------"
                                 
cart.items.each { |item, cnt| puts "#{item}               #{cnt}               #{PRICE_TABLE[item][:unit_price]}"}
puts "Total price : $#{ discounted_calc.calculate_bill }"
puts "Yous saved $#{ ( calc.calculate_bill - discounted_calc.calculate_bill).round(2) } today."