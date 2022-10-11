require_relative './taxcalculator'

File.open("bill.txt", "r+") do |file|
  puts "Enter the number of items in bill"
  n = gets.to_i
  while n > 0
    puts "Enter Item..."
    items = gets
    items = items.chomp  
    file << items  
    file.write "\n"
    n = n - 1
  end
end

File.open("bill.txt").readlines.each do |line|
    TaxCalculator.tax_calculator(line)
  end
  
TaxCalculator.final_output