class Company
  attr_accessor :company_name
  attr_reader :employees

  def initialize(name)
    @company_name  = name
    @employees   = []
  end

  def add_employee(*employee)
    @employees << employee
  end
end


class Employee
  attr_accessor :name, :position
  attr_reader :id

  def initialize(name, position)
    @name     = name
    @position = position
    @id       = rand(100_000_000).to_s.insert(2, '-').insert(6, '-')
  end

  def to_s
    puts "Family Name: #{name} Position: #{position}"
  end
end

devbootcamp = Company.new("Dev Bootcamp")
shereef = Employee.new("Shereef Bishay", "Master Of The Bootiverse")
annamarie = Employee.new('annamarie', 'Master Photographer')
mark = Employee.new('mark', 'CTO')
jason = Employee.new('jason', 'tall guy')
justin = Employee.new('justin', 'beard guy')

devbootcamp.add_employee(mark, jason, justin, annamarie, shereef)

# devbootcamp.employees.push(shereef)
# devbootcamp.employees.push(annamarie)
# puts (p "#{devbootcamp.company_name} - #{devbootcamp.employees.first.name}: #{devbootcamp.employees.first.position}") == "Dev Bootcamp - Shereef Bishay: Master Of The Bootiverse"
# puts (p "#{devbootcamp.company_name} - #{devbootcamp.employees.first.name}: #{devbootcamp.employees.first.position}")
# puts devbootcamp.employees
puts devbootcamp.employees.to_s



