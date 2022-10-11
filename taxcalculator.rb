class TaxCalculator
  def self.tax_calculator(item)
    input_array = item.split(" ")
    quantity = input_array[0].to_f
    given_prize = input_array[-1].to_f
  
    @@input_string = input_array.join

    if quantity > 1
     actual_price = given_prize / quantity
    else
      actual_price = given_prize
    end

    #5%
    five_percent = ((5.0/100.0)*actual_price)
    #10%
    ten_percent = ((10.0/100.0)*actual_price)
    #15%
    fifteen_percent = ((15.0/100.0)*actual_price)
  
    def self.essential 
      if @@input_string.include? "chocolate"
        return true
      elsif @@input_string.include? "book"
        return true
      elsif @@input_string.include? "chocolates"
        return true
      elsif @@input_string.include? "pills"
        return true
      else
        return false
      end
    end
    
    def self.imported 
      if @@input_string.include? "imported"
        return true
      else
        return false
      end
    end
    
    if TaxCalculator.essential == true && TaxCalculator.imported == false
      @final_price = actual_price
      @tax_paid = 0
    elsif TaxCalculator.essential == true && TaxCalculator.imported == true
      @final_price = actual_price + five_percent
      @tax_paid = five_percent
    elsif TaxCalculator.essential == false && TaxCalculator.imported == false
      @final_price = actual_price + ten_percent
      @tax_paid = ten_percent
    else
      @final_price = actual_price + fifteen_percent
      @tax_paid = fifteen_percent
    end
    
    @sales_taxes = @sales_taxes.to_f + @tax_paid.to_f
    @total = @total.to_f + @final_price.to_f

    def self.final_output
      puts "Sales Taxes: #{@sales_taxes.round(2)}"
      puts "Total: #{@total.round(2)}"      
    end
  end
end

