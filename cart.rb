class Cart
  # Class for containing items as key and value pair
  attr_reader :items
  
  def initialize
    @items = {}
    @items.default = 0
  end
  
  def add_to_cart(item) # function to add items to cart
    items[item] += 1
  end
end