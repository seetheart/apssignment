class User
  attr_reader :cart
  
  def initialize(cart)
    @cart = cart
  end
  
  def add_to_cart(item)
    cart.add_to_cart(item)
  end
end