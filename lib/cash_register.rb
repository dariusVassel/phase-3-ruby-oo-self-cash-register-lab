require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :items_total
    
    def initialize(discount = 0)
        @discount = discount
        @items = []
        @total = 0
    end

    def add_item(title, price, quantity = 1)
        self.items_total = price * quantity
        self.total += self.items_total

        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount != 0
            discounted_total =  (total * discount) / 100
            self.total -= discounted_total
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        
        self.total -= self.items_total
        items.pop
    end

end

# binding.pry