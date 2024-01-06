class BaseController
  attr_reader :request, :response
  def initialize(request)
    @request = request
    @response = {}
  end
end

class ShoppingController < BaseController
  def calculate_bill
    user_input = request[:item_list].split(",").map(&:strip)
    cart = Cart.new # Initializing a cart
    user = User.new(cart) # Initializing a user
    user_input.each { |item| user.add_to_cart(item) } # Add to cart by customer

    calc = CalculateTotalBill.new(cart) # calculator class
    discounted_calc = DiscountedBill.new(cart) # discounted calculator class
    @response[:total_bill] = discounted_calc.calculate_bill
    @response[:saved] = ( calc.calculate_bill - discounted_calc.calculate_bill).round(2)
    
    response
  end
end