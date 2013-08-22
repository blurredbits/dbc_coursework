require 'csv'
require 'date'

class Person

  def initialize(id,first_name,last_name,email,phone,created_at)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = DateTime.parse(created_at.to_s)
  end

  def to_a
    [@id, @first_name, @last_name, @email, @phone, @created_at]
  end


end

class PersonParser
  attr_reader :file
  
  def initialize(file)
    @file = file
    @people = nil
  end
  
  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people
    @people ||= []
    CSV.foreach(@file, :headers => true) do |row|
      @people << Person.new(row[0],row[1],row[2],row[3],row[4],row[5])
    end
    @people
    
  end

  def add_person(id,first_name,last_name,email,phone,created_at)
    @people << Person.new(id,first_name,last_name,email,phone,created_at)
  end

  def show_people
    @people.each do |person|
      person.each
    end
  end

  def save
    CSV.open('people_two.csv', 'wb') do |csv|
      @people.each do |person|
        csv << person.to_a 
      end
    end
  end
end


#------------------------------------------------------------------------------
parser = PersonParser.new('people.csv')
parser.people

parser.add_person(201, "Nestor", "Castillo", "nc@yahoo.com", "123-443-4343", Time.now)
parser.save

puts "There are #{parser.people.size} people in the file '#{parser.file}'."
