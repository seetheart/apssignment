require 'active_support/core_ext/hash/indifferent_access'
require_relative './cart'
require_relative './user'
require_relative './calculate_bill'
require_relative './shopping_controller'

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

class InputHandler
  attr_reader :input, :request, :controller_result, :result

  def initialize(input)
    @input = input
  end

  def perform
    form_request &&
      call_controller &&
      set_result
  end

  def form_request
    @request = { item_list: input }
  end

  def call_controller
    shopping = ShoppingController.new(request)
    @controller_result = shopping.calculate_bill
  end

  def set_result
    @result = controller_result
  end
end

input = InputHandler.new("milk,milk,milk,bread,bread,bread,bread,apple,banana")
puts input.perform
