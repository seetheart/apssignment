class Cart
  attr_reader :items
  
  def initialize
    @items = {}
    @items.default = 0
  end
  
  def add_to_cart(item)
    items[item] += 1
  end
end