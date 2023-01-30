#!/bin/ruby



def long_division(dividend, divisor)

  digits = dividend.digits
  first_digit = digits.pop

  quotient = first_digit / divisor

  first_product = quotient * divisor
  
  first_diff = first_digit - first_product

  second_digit = digits.pop
  new_dividend = "#{first_diff}#{second_digit}".to_i
  second_digit_quotient = new_dividend / divisor
  quotient = "#{quotient}#{second_digit_quotient}".to_i

  second_product = second_digit_quotient * divisor
  second_diff =  "#{first_diff}#{second_digit}".to_i - second_product

  third_digit = digits.pop
  new_dividend = "#{second_diff}#{third_digit}".to_i
  third_digit_quotient = new_dividend / divisor
  quotient = "#{quotient}#{third_digit_quotient}".to_i

  third_product = third_digit_quotient * divisor
  remainder =  "#{second_diff}#{third_digit}".to_i - third_product

  puts "    #{quotient}"
  puts "  _________"
  puts "#{divisor} ) #{dividend}"
  puts "   -#{first_product}"
  puts "   ---"
  puts "    #{first_diff}#{second_digit}"
  puts "   -#{second_product}"
  puts "    ---"
  puts "     #{second_diff}#{third_digit}"
  puts "    -#{third_product}"
  puts "     ---"
  puts "      #{remainder}"
end

def long_division_2(dividend, divisor)

  digits = dividend.digits
  number = ""
  quotient = 0

  loop do

    loop do 
      number = "#{number}#{digits.pop}".to_i
      quotient = number / divisor
      break if quotient > 0
    end

    puts "quotient: #{quotient}, number: #{number}"

    product = quotient * divisor
    diff = number - product
  end
end


dividend = 466
divisor = 5

long_division_2(dividend, divisor)

