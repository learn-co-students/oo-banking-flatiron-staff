class BankAccount
  attr_accessor :balance, :status, :transfer
  attr_reader :name

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
    if status = "open" && balance > 0
      return true
    else
      return false
    end
  end

end
