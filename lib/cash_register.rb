require 'pry'
class CashRegister
    attr_accessor :total, :discount, :cart

    def initialize(discount = nil)
        @total = 0.0
        @discount = discount
        @@cart = []
    end

    def add_item(item, price, quantity = 1)
            @@cart << {name: item, price: price * quantity, quantity: quantity}
            @total += price * quantity
    end

    def apply_discount
        if discount
            @total = total - total * (discount/100.0)
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
            return "There is no discount to apply."
        end
    end

    def items
        items_in_cart = []
        @@cart.each do |item| 
            item[:quantity].times do 
                items_in_cart << item[:name]
            end
        end
        items_in_cart
    end

    def void_last_transaction
        @total -= @@cart.last[:price] 
        @@cart.pop
    end

end