require 'pry'

class BankAccount

  attr_accessor :status, :balance
  # attr_writer :balance
  attr_reader :name


  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    @balance = 1000 + amount
    @balance
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    (balance > 0) && (@status == 'open')
  end

  def close_account
    @status = 'closed'
  end

end
