class Sudoku
  attr_reader :cells, :board

  def initialize(board_string)
    @board_string = board_string
    @board = create_board
    @cells = create_cells
  end

  def create_new_board_string
    @cells.inject("") { |string,cell| string << cell.value.to_s }
  end

  def create_board
    @board_string.split(//).each_slice(9).to_a
  end

  def print_board
    puts "SODUKO SOLUTION FOR: \n #{@board_string}"
    puts ""
    @board.each_with_index do |row,index|
      if index % 3 == 0
      puts "+------+-----+------+"
        print "| #{row.join(" ")} |","\n"
      else
        print "| #{row.join(" ")} |","\n"
      end
    end
    puts "+------+-----+------+"

  end

  def create_cells
    new_cell_arr = []
    @board.each do |row|
      row.each_with_index do |col, i|
        new_cell = Cell.new(col.to_i,board.index(row),i)
        new_cell_arr << new_cell
      end
    end
    new_cell_arr
  end

  def is_solved?
    @cells.none? { |cell| cell.value == 0 }
  end

  def solve!
    until is_solved?
      @cells.each do |cell|
        cell.solve_cell!(@cells)
      end
      @board_string = create_new_board_string
      @board = create_board
    end
    print_board
  end

end

class Cell
  attr_accessor :value
  attr_reader :row_location, :col_location

  def initialize(value,row,col)
    @value = value
    @row_location = row
    @col_location = col
  end

  def id_unknowns_row(cells)
    result = []
    known_values = (1..9).to_a
    cells.each do |cell|
      if (cell.row_location == self.row_location) && cell.value > 0
        result << cell.value
      end
    end
    known_values - result
  end

  def id_unknowns_col(cells)
    result = []
    known_values = (1..9).to_a
    cells.each do |cell|
      if (cell.col_location == self.col_location) && cell.value > 0
        result << cell.value
      end
    end
    known_values - result
  end

  def id_unknowns_sqr(cells)
    result = []
    solved_array = (1..9).to_a
    cells.each do |cell|
      if (cell.which_square? == self.which_square?) && cell.value > 0
        result << cell.value
      end
    end
    solved_array - result
  end

  def which_square?
    return 0 if (0..2).include?(row_location) && (0..2).include?(col_location)
    return 1 if (3..5).include?(row_location) && (0..2).include?(col_location)
    return 2 if (6..8).include?(row_location) && (0..2).include?(col_location)
    return 3 if (0..2).include?(row_location) && (3..5).include?(col_location)
    return 4 if (3..5).include?(row_location) && (3..5).include?(col_location)
    return 5 if (6..8).include?(row_location) && (3..5).include?(col_location)
    return 6 if (0..2).include?(row_location) && (6..8).include?(col_location)
    return 7 if (3..5).include?(row_location) && (6..8).include?(col_location)
    return 8 if (6..8).include?(row_location) && (6..8).include?(col_location)
  end

  def solve_cell!(cells)
    return self.value if self.value != 0
    possible_values = id_unknowns_row(cells) & id_unknowns_col(cells) & id_unknowns_sqr(cells)
    if possible_values.size == 1
      self.value = possible_values.first
    end
  end

end

board_string = '003020600900305001001806400008102900700000008006708200002609500800203009005010300'

game = Sudoku.new(board_string)
game.solve!
