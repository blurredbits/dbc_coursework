class Hospital

  attr_accessor :employees, :patients

  def initialize(hospital_info)
    @name = hospital_info[:name]
    @location = hospital_info[:location]
    @rooms = hospital_info[:rooms]
    @employees = []
    @patients = []
  end

  def run!
    print_welcome
    check_credentials(login)
    while @logged_in
      puts @employee.menu_options
        case get_option
        when "1"
          add_employee
        when "2"
          add_patient
        when "Q"
          @logged_in = false
        end
    end
  end

  def print_welcome
    welcome = []
    welcome << "Welcome to #{@name} Hospital, located in #{@location}"
    welcome << "-" * 40
    welcome.join('\n')
    puts welcome
  end

  def get_option
    puts "-" * 40
    puts "What would you like to do? Enter 'Q' to Quit"
    option = gets.chomp
  end


  def login
    login_info = {}
    puts "Please enter your user name: "
    attempted_username = gets.chomp
    puts "Please enter your password: "
    attempted_password = gets.chomp
    login_info = {a_username: attempted_username, a_password: attempted_password}
  end

  def check_credentials(login_info)
    @employee = @employees.find { |employee| employee.username == login_info[:a_username]}
    if login_info[:a_password] != @employee.password
      puts "Password does not match. Please try again.\n"
    else
      puts "Welcome #{@employee.username}, your access level is: #{@employee.role}\n"
      @logged_in = true
    end
  end

  def add_employee
    puts "Please enter new username:"
    n_username = gets.chomp
    puts "Please enter new password:"
    n_password = gets.chomp
    puts "Please enter role [ADMIN, DOCTOR, NURSE or JANITOR]"
    n_role = gets.chomp
    n_emp_info = {username: n_username, password: n_password, role: n_role}
    new_employee = Employee.new(n_emp_info)
    @employees << new_employee
    puts "Employee added."
  end

  def add_patient
    puts "Please enter new patient first name:"
    n_patient_first_name = gets.chomp
    puts "Please enter new patient last name:"
    n_patient_last_name = gets.chomp
    puts "Please enter new patient insurance company:"
    n_patient_insurance = gets.chomp
    n_pat_info = {first_name: n_patient_first_name, last_name: n_patient_last_name, insurance: n_patient_insurance}
    new_patient = Patient.new(n_pat_info)
    @patients << new_patient
    puts "Patient added."
  end

end

class Employee

  attr_reader :username, :password, :role

  def initialize(emp_info)
    @username = emp_info[:username]
    @password = emp_info[:password]
    @role = emp_info[:role]
  end

  def menu_options
    menu = ""
    case role
    when 'ADMIN'
      menu << "(1) Add Employee\n"
      menu << "(2) Add Patient\n"
      menu << "(-) List patients\n"
      menu << "(-) View record <patient_id>\n"
      menu << "(-) Add record <patient_id>\n"
      menu << "(-) Remove Record <patient_id> <record_id>\n"
    when 'DOCTOR' then
      menu << "(-) List patients\n"
      menu << "(-) View record <patient_id>\n"
      menu << "(-) Add record <patient_id>\n"
      menu << "(-) Remove Record <patient_id> <record_id>\n"
    when 'NURSE' then
      menu << "(-) List patients\n"
      menu << "(-) View record <patient_id>\n"
    when 'JANITOR' then
      menu << "(-) List patients\n"
    end
  end
end

class Patient
  def initialize(patient_info)
    @first_name = patient_info[:first_name]
    @last_name = patient_info[:last_name]
    @insurance = patient_info[:insurance]
  end
end

hospital = Hospital.new({name: "General", location: "Chicago", rooms: 300})
mark = Employee.new({username: "MMORRIS", password: "secret", role: "ADMIN"})
vi = Employee.new({username: "VI", password: "secret", role: "DOCTOR"})
julie = Employee.new({username: "JULES", password: "secret", role: "NURSE"})
ted = Employee.new({username: "TED", password: "secret", role: "JANITOR"})

hospital.employees << mark
hospital.employees << vi
hospital.employees << julie
hospital.employees << ted

hospital.run!
