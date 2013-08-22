class BankAccount
  attr_accessor :customer_name, :type
  attr_reader :acct_number

  def initialize(customer_name, type, acct_number)
    @customer_name = customer_name
    @type = type
    @acct_number = acct_number
  end

  def to_s
    "#{customer_name}: #{type} #{acct_number.sub(/\d{3}-\d{2}/, 'XXXXX')}"
  end


end




chase = BankAccount.new("annamarie", "401k", "123-123-123")
# p chase
# str = "My super secret account is #{chase}"
# p str
# p chase.customer_name = "mark"
p chase.type = "checking"
p chase.customer_name = "mark"
p chase
p chase.acct_number = "345-22-12345667"
