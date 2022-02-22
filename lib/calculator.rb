# frozen_string_literal: true

def prompt(msg)
  puts "=> #{msg}"
end

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
  num1.to_f / num2
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

def perform_operation(operation_num, num1, num2)
  num1 = num1.to_i
  num2 = num2.to_i

  case operation_num
  when '1' then add(num1, num2)
  when '2' then subtract(num1, num2)
  when '3' then multiply(num1, num2)
  when '4' then divide(num1, num2)
  end
end

def operation_symbol(operation_num)
  case operation_num
  when '1' then '+'
  when '2' then '-'
  when '3' then '*'
  when '4' then '/'
  end
end

def display_result(num1, num2, symbol, result)
  "#{num1} #{symbol} #{num2} is #{result}."
end

def valid_number?(num)
  num =~ /[0-9]+/
end

prompt 'Welcome to The Simple Calculator'

loop do
  num1 = nil
  loop do
    prompt 'What is your first number?'
    num1 = gets.chomp

    break if valid_number?(num1)

    prompt 'Please provide a valid number.'
  end

  num2 = nil
  loop do
    prompt 'What is your second number?'
    num2 = gets.chomp

    break if valid_number?(num2)

    prompt 'Please provide a valid number.'
  end

  prompt display_operation_types

  operation_num = nil
  loop do
    operation_num = gets.chomp
    break if operation_num =~ /[1-4]/

    prompt 'Please provide a number between 1-4.'
  end

  result = perform_operation(operation_num, num1, num2)
  symbol = operation_symbol(operation_num)

  prompt display_result(num1, num2, symbol, result)

  prompt 'Would you like to perform another calculation?'
  answer = gets.chomp
  break unless answer =~ /^y.*/i
end

prompt 'Thank you for using The Simple Calculator'
