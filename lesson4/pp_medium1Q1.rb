class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

bank = BankAccount.new
puts bank.positive_balance?

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot
# to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

=begin
attr_reader :balance creates the balance getter method so that we can call balance
throughout the class BankAccount and it will enable us to reference the @balance varaible
without having to type the @balance instance variable
=end
