require "pry"
#I think of this as writing a blue print for cash registers at King Soopers. 
#class CashRegister- this is the blueprint of all traits that the cash register will have and how they will operate
#object cash_register 
#instance cash_register_1, cash_register_2, cash_register_3

# Create a class called CashRegister
# Use initialize method 
    # to declare traits (show total, discount, array of all items scanned) 
    # that you want all instances (cash_register_1...2... etc ) to posess
    # total =0 (start with 0 as you will add price of the item to it)
    # discount (set a default value of 0 as this is optional,it also goes into the parenthesis)
    # items_scanned (empty array to add scanned items to)
    #attr_accessor (We also want to list all variables used to have setter and getter method applied)
class CashRegister
    attr_accessor :total, :discount, :price, :items_scanned, :last_item_scanned
    def initialize (discount =0)
        @total=0
        @discount=discount
        @items_scanned=[]
    end
    
# create a method called add_item
# when you add an item, cash register keeps track of the name,price, and quantity of an item.
# self in this case refers to an individual cash register.
# add price * quantity of item scanned and add it to total of the cash register this method is applying to
# for as many number there are items
# shovel item_name into the array. We do this because there is another method that asks for this
# declare that the price of item just scanned is its price and quantity. this will come in handy for method that is coming up
    def add_item(item_name, price, quantity=1)
        self.total += price * quantity
            quantity.times do
                items_scanned << item_name
            end
            self.last_item_scanned =price*quantity
      end

#create a method called apply discount
# if there is a discount
#apply the discount to the total
      # make sure when you are doing math operation, all numbers should be of the same type(float or int)
      # notice that 100 is a float. we do not know if discount is an integer or float. so apply.to_f method to convert discount to a float
      # then, convert the discounted price to an integer as that is what the test asks for
      # return a message with updated total
#if not 
#return a message that there is not discount to apply
      def apply_discount
        if discount != 0
          self.total = (total * ((100.0 - discount.to_f)/100)).to_i

          "After the discount, the total comes to $#{self.total}."
        else
          "There is no discount to apply."
        end
      end

# def a method called items. this returns an array of items_scanned.
# instead of creating a brand new variables and increasing the number of code, we already shoveled all items into an array in our add_item method
# we defined items_scanned at attr_accessor so it can be accessed in other methods      
    def items
        items_scanned
      end 

# define a method called void_last_transaction.
# void the last transaction and return the revised total
      def void_last_transaction
        self.total -=self.last_item_scanned
    end
end



