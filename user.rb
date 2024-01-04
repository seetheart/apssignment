class User
  # User class containing cart and a function to insert 
  # items into the cart which delegates the add_to_cart
  # function from Cart class.
  attr_reader :cart
  
  def initialize(cart)
    @cart = cart
  end
  
  def add_to_cart(item)
    cart.add_to_cart(item)
  end
end