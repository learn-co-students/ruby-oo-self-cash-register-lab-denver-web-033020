
class CashRegister
    attr_accessor :total, :discount, :items
  
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = []
    end
  
    def add_item(item_name, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items.push(item_name) }
      @last_transaction.push([item_name, price, quantity])
    end
  
    def apply_discount
      if discount == 0
         "There is no discount to apply."
       else
         @total -= (@total * (@discount / 100.0)).to_i
         "After the discount, the total comes to $#{@total}."
       end
     end
  
     def items
       @items
     end
  
     def void_last_transaction
       last_transaction = @last_transaction.pop
       @total -= last_transaction[1] * last_transaction[2]
     end
  end 
