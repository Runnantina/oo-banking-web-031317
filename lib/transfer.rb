require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
    # binding.pry
    # "k"
  end

  def reverse_transfer
    # receiver balance has to be greater than or equal to amount for reverse to be possible
    # receiver sends back to sender
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end



end
