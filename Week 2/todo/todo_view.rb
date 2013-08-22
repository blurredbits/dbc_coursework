class View

  def print_list(todo)
    todo.each do |todo|
      puts todo
    end
  end

  def print_add(arg)
    puts "Task added: #{arg}"
  end

  def print_del(id)
    puts "Deleted item: #{id}"
  end
end
