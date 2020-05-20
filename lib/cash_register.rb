require 'pry'
class CashRegister
  attr_reader :discount
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = {}
  end

  def add_item(item, price, quantity = 1)
    @cart[item] = { price: price }
    @cart[item][:quantity] = quantity
    @total += (price * quantity)
  end

  def apply_discount
    if @discount != 0
      @total -= @total * (@discount / 100.to_f)
      @total = @total.to_i
      "After the discount, the total comes to $#{@total}."
    else
      'There is no discount to apply.'
    end
  end

  def items
    @cart.reduce([]) do |item_list, (item, item_information)|
      item_information[:quantity].times {item_list << item}
      item_list
    end
  end

  def void_last_transaction
    ordered_cart = @cart.to_a
    removed_item = ordered_cart.pop
    @cart = ordered_cart.to_h
    removed_item = removed_item.last
    @total -= removed_item[:price] * removed_item[:quantity]
  end
end