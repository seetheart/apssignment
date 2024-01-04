class Bill
  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def calculate_bill
    raise "Not Implemented error"
  end
end

class CalculateTotalBill < Bill
  def initialize(cart)
    super(cart)
  end

  def calculate_bill
    total_price = 0
    cart.items.each { |item, cnt| total_price += PRICE_TABLE[item][:unit_price] * cnt }
  
    total_price
  end
end

class DiscountedBill < Bill
  def initialize(cart)
    super(cart)
  end
    
  def calculate_bill
    total_sale_price = 0
    cart.items.each do |item, cnt|
      total_sale_price += item_total_price(item, cnt)
    end
      
    total_sale_price
  end

  private

  def item_total_price(item_name, cnt)
    item_price = 0
    if is_on_sale?(item_name)
      sale_count = PRICE_TABLE[item_name][:sale_count]
      item_price += PRICE_TABLE[item_name][:unit_price] * ( cnt % sale_count )
      item_price += PRICE_TABLE[item_name][:sale_price] * ( cnt / sale_count )
    else
      item_price =  PRICE_TABLE[item_name][:unit_price] * cnt
    end
    
      item_price
    end
    
    def is_on_sale?(item_name)
      return true unless PRICE_TABLE[item_name][:sale_count].nil?
    
      false
    end
end