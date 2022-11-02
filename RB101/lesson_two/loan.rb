def prompt(string)
  Kernel.puts("=> #{string}")
end

def float?(number)
  number.to_f().to_s() == number
end

def integer?(number)
  number.to_i().to_s() == number
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def monthly_payments(amount, mpr, months)
  m = amount.to_f * (mpr / (1 - (1 + mpr)**(-months)))
  m.truncate(2)
end

prompt("Welcome to my loan calculator!")
prompt("What's your name?")

name = nil

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name:")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  loan_amount = nil
  loop do
    prompt("Enter your loan amount.")
    loan_amount = Kernel.gets().chomp()

    if loan_amount.to_i() > 0 && valid_number?(loan_amount)
      break
    else
      prompt("Make sure to enter a valid positive number")
    end
  end

  apr = nil
  loop do
    prompt("Enter your Annual Percentage Rate? (%)")
    apr = Kernel.gets().chomp()

    if apr > 0.to_i() && valid_number?(apr)
      break
    else
      prompt("Make sure to enter a valid number")
    end
  end

  loan_duration = nil
  loop do
    prompt("What is your loan duration in years?")
    loan_duration = Kernel.gets().chomp()

    if loan_duration.to_i() > 0 && valid_number?(apr)
      break
    else
      prompt("Make sure to enter a valid number")
    end
  end

  loan_duration_months = loan_duration.to_i() * 12
  monthly_interest_rate = (apr.to_f() / 100) / 12

  prompt("Your monthly payment is:
  $#{monthly_payments(loan_amount, monthly_interest_rate, loan_duration_months)}
  at a monthly interst rate of #{monthly_interest_rate.truncate(3) * 100}%
  for #{loan_duration_in_months} months")

  puts("\nWould you like to calculate another loan? Press Y for yes, N for no")
  user_response = gets().chomp()

  unless user_response.downcase().start_with?('y')
    prompt("Thanks for using loan calculator!")
    break
  end
end
