class BankAccount
  attr_accessor :balance, :status, :transfer, :closed, :sender, :receiver
  attr_reader :name, :amount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    @balance = @balance + num
    @balance
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
