# frozen_string_literal: true

class Calculator
  def self.add(num1, num2)
    num1.to_i + num2.to_i
  end

  def self.subtract(num1, num2)
    num1.to_i - num2.to_i
  end

  def self.multiply(num1, num2)
    num1.to_i * num2.to_i
  end

  def self.divide(num1, num2)
    num1.to_f / num2.to_i
  end
end

class CalculationSession
  def start
    loop do
      display_welcome
      @num1 = choose_number('first')
      @num2 = choose_number('second')
      display_calculation_types
      @calculation_num = select_calculation_type
      @result = perform_calculation
      display_result
      break unless play_again?
    end
    display_goodbye
  end

  private

  def prompt(msg)
    puts "=> #{msg}"
  end

  def display_welcome
    prompt 'Welcome to The Simple Calculator'
  end

  def choose_number(current)
    loop do
      prompt "What is your #{current} number?"
      num = gets.chomp

      return num if valid_number?(num)

      prompt 'Please provide a valid number.'
    end
  end

  def valid_number?(num)
    num =~ /^-?\d+$/
  end

  def display_calculation_types
    prompt <<~OPERATION
      What mathematical operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
    OPERATION
  end

  def select_calculation_type
    loop do
      calculation_num = gets.chomp
      return calculation_num if calculation_num =~ /[1-4]/

      prompt 'Please provide a number between 1-4.'
    end
  end

  def perform_calculation
    case @calculation_num
    when '1' then Calculator.add(@num1, @num2)
    when '2' then Calculator.subtract(@num1, @num2)
    when '3' then Calculator.multiply(@num1, @num2)
    when '4' then Calculator.divide(@num1, @num2)
    end
  end

  def operator_symbol
    case @calculation_num
    when '1' then '+'
    when '2' then '-'
    when '3' then '*'
    when '4' then '/'
    end
  end

  def display_result
    prompt "#{@num1} #{operator_symbol} #{@num2} is #{@result}."
  end

  def display_goodbye
    prompt 'Thank you for using The Simple Calculator'
  end

  def play_again?
    prompt 'Would you like to perform another calculation?'
    answer = gets.chomp
    answer =~ /^y.*/i
  end
end

CalculationSession.new.start
