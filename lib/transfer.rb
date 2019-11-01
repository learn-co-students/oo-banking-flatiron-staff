class Transfer
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    return if @status == 'complete'

    unless valid?
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end

    transfer(1, 'complete')
  end

  def reverse_transfer
    return unless @status == 'complete'

    transfer(-1, 'reversed')
  end

  private

  def transfer(direction, status)
    @sender.deposit(-1 * direction * @amount)
    @receiver.deposit(direction * @amount)
    @status = status
  end
end
