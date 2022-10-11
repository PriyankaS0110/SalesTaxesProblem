require_relative './taxcalculator'

class Validator
  def self.has_digits(str)
    if str.count("0-9") > 0 &&  str.count("a-zA-Z") > 0 && str.count("[0-9]*\.[0-9]")
      TaxCalculator.tax_calculator(str)
    else
      puts "Invalid Item Added"
    end
  end
end
