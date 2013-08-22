require 'csv'

class List
  attr_reader :todo_list

  def initialize
    @todo_list = []
    @file = ''
    @header = %w[id description complete]
  end

  def read_csv(file)
    todo_csv = CSV.table(file, :headers => true )
    todo_csv.each do |todo|
      @todo_list << Task.new(todo)
    end
  end

  def write_csv(list, file)
    CSV.open(file, "wb") do |csv|
      csv << @header.to_a
      list.todo_list.each do |todo|
        csv << todo.to_a
      end
    end
  end

  def set_file(file)
    @file = file
  end

  def add_task(description)
    task = {}
    task[:id] = @todo_list.size + 1
    task[:description] = description
    task[:complete] = 'false'
    @todo_list << Task.new(task)
  end

  def delete_task(task)
    @todo_list.delete_at(task-1)
  end

  def create_empty_list
    @todo_list = []
  end

  def complete_task(task)
    task.set_complete
  end

end

class Task
  def initialize(task)
    @id = task[:id]
    @description = task[:description]
    @complete = task[:complete] == 'false' ? false : true
  end

  def set_complete
    @complete = true
  end

  def to_s
    "#{@id}. #{@description} Complete? #{@complete ? "Yes" : "No" }"
  end

  def to_a
    [@id, @description, @complete]
  end
end
