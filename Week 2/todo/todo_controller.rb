class Todo_Controller
  attr_reader :list, :view

  def initialize (list = List.new, view = View.new)
    @list = list
    @view = view
    @filename = "todo.csv"
    @list.read_csv(@filename)
  end

  def run!
    parse_arg
  end

  def parse_arg
    arg = ARGV[1..-1].join(" ")

    case ARGV[0].upcase
    when 'LIST'
      @view.print_list(list.todo_list)
    when 'ADD'
      @list.add_task(arg)
      @view.print_add(arg)
      @list.write_csv(list, @filename)
      @view.print_list(list.todo_list)
    when 'DELETE'
      @list.delete_task(arg.to_i)
      @view.print_del(arg)
      @list.write_csv(list, @filename)
      @view.print_list(list.todo_list)
    end
  end

end
