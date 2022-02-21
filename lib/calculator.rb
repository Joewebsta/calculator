# frozen_string_literal: true

def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def multiply(num1, num2)
  num1 * num2
end

def divide(num1, num2)
  num1 / num2
end

def display_operation_types
  <<~OPERATION
    What mathematical operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  OPERATION
end

def perform_operation(operation, num1, num2)
  case operation
  when '1' then add(num1, num2)
  when '2' then subtract(num1, num2)
  when '3' then multiply(num1, num2)
  when '4' then divide(num1, num2)
  end
end

def operation_symbol(operation)
  case operation
  when '1' then '+'
  when '2' then '-'
  when '3' then '*'
  when '4' then '/'
  end
end

def display_result(num1, num2, symbol, result)
  "#{num1} #{symbol} #{num2} is #{result}."
end

puts 'What is your first number?'
num1 = gets.chomp.to_i

puts 'What is your second number?'
num2 = gets.chomp.to_i

puts display_operation_types
operation = gets.chomp

result = perform_operation(operation, num1, num2)
symbol = operation_symbol(operation)

puts display_result(num1, num2, symbol, result)
