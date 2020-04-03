
require 'pp'
class CashRegister
    attr_accessor :cash_register, :total, :discount, :title, :price, :quantity, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        
        @title = title
        @price = price
        @quantity = quantity
        
        i = 0
        while i < quantity 
            @items << title
            i += 1
        end
        @total += price * quantity
    end

    def apply_discount
        
        if @discount != 0
            @total = @total - @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - (@price * @quantity)
        @total
    end
end