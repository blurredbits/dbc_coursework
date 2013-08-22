# You should re-use and modify your old BoggleBoard class
# to support the new requirements

class BoggleBoard

  attr_accessor :letters

  def initialize
    @letters = []
    @dice_array = [ ["A","A","E","E","G","N"],
                   ["E","L","R","T","T","Y"],
                   ["A","O","O","T","T","W"],
                   ["A","B","B","J","O","O"],
                   ["E","H","R","T","V","W"],
                   ["C","I","M","O","T","U"],
                   ["D","I","S","T","T","Y"],
                   ["E","I","O","S","S","T"],
                   ["D","E","L","R","V","Y"],
                   ["A","C","H","O","P","S"],
                   ["H","I","M","N","Q","U"],
                   ["E","E","I","N","S","U"],
                   ["E","E","G","H","N","W"],
                   ["A","F","F","K","P","S"],
                   ["H","L","N","N","R","Z"],
                   ["D","E","I","L","R","X"] ]

  end

  def shake!
    @dice_array.shuffle!
    @dice_array.each_with_index do |die, index|
      @letters << Square.new(index,die.sample)
    end
  end

  def to_s
    board_string = ""
    board_string << "Word Search!\n"
    board_string << "------------\n"
    @letters.each_with_index do |spot, index|
      if spot.letter == 'Q'
        board_string << "Qu".ljust(3)
      else
        board_string << spot.letter.ljust(3)
      end
      board_string << "\n" if (index + 1) % 4 == 0
    end
    board_string << "\n\n"
    board_string
  end

  # Horizontals 

  def search_lr(location)
    result = []
    if location == 0 || location == 4 || location == 8 || location == 12
      3.times do |x|  
        result << @letters[location + x + 1].letter
      end
    end
    if location == 1 || location == 5 || location == 9 || location == 13
      2.times do |x| 
        result << @letters[location + x + 1].letter
      end     
    end  
    return result  
  end

  def search_rl(location)
    result = []
    if location == 3 || location == 7 || location == 11 || location == 15
      3.times do |x| 
        result << @letters[location-x-1].letter
      end 
    end 
    if location == 2 || location == 6 || location == 10 || location == 14
      2.times do |x| 
        result << @letters[location-x-1].letter 
      end
    end
    return result  
  end
  
  # Verticals

  def search_ud(location)
    result = []
    if location == 0 || location == 1 || location == 2 || location == 3
      3.times do |x| 
        result << @letters[location + (x+1) * 4].letter 
      end
    end
    if location == 4 || location == 5 || location == 6 || location == 7
      2.times do |x| 
        result << @letters[location + (x+1) * 4].letter 
      end
    end 
    return result  
  end

  def search_du(location)
    result = []
    if location == 12 || location == 13 || location == 14 || location == 15
      3.times do |x| 
        result << @letters[location + (x+1) * -4].letter 
      end
    end
    if location == 8 || location == 9 || location == 10 || location == 11  
      2.times do |x| 
        result << @letters[location + (x+1) * -4].letter 
      end
    end    
    return result  
  end

  # Diagonals -- SE Southeast
  #              SW Southwest
  #              NE Northeast
  #              NW Northwest


  def search_se(location)
    result = []
    if location == 0 
      3.times do |x| 
        result << @letters[location + (x+1) * 5].letter
      end
    end
    if location == 1 || location == 4 || location == 5 
      2.times do |x| 
        result << @letters[location + (x+1) * 5].letter 
      end 
    end
    return result  
  end

  def search_sw(location)
    result = []
    if location == 3
      3.times do |x| 
        result << @letters[location + (x+1) * 3].letter 
      end
    end
    if location == 2 || location == 6 || location == 7 
      2.times do |x| 
        result << @letters[location + (x+1) * 3].letter 
      end
    end  
    return result  
  end

  def search_nw(location)
    result = []
    if location == 15
      3.times do |x| 
        result << @letters[location + (x+1) * -5].letter 
      end
    end
    if location == 10 || location == 11 || location == 14 
      2.times do |x| 
        result << @letters[location + (x+1) * -5].letter 
      end
    end  
    return result  
  end
  
  def search_ne(location)
    result = []
    if location == 12
      3.times do |x| 
        result << @letters[location + (x+1) * -3].letter 
      end
    end
    if location == 8 || location == 9 || location == 13 
      2.times do |x| 
        result << @letters[location + (x+1) * -3].letter 
      end
    end  
    return result  
  end

  def search(word)
    search = word.upcase
    search = search.split("").first
    horizontal = []
    vertical = []
    diagonal = []
    1.times do
    @letters.each do |letter|
      if search == letter.letter
        letter.directions.each do |position|
          case position
          when "LR" then horizontal << search_lr(letter.location)
          when "RL" then horizontal << search_rl(letter.location)
          when "UD" then vertical << search_ud(letter.location)
          when "DU" then vertical << search_du(letter.location)
          when "NE" then diagonal << search_ne(letter.location)
          when "NW" then diagonal << search_nw(letter.location)
          when "SE" then diagonal << search_se(letter.location)
          when "SW" then diagonal << search_sw(letter.location)
          end
        end
        horizontal.insert(0, search).flatten!
        vertical.insert(0, search).flatten!
        diagonal.insert(0, search).flatten!

        if horizontal.join == word || vertical.join == word || diagonal.join == word
          puts "Search term FOUND!"
        end
        break
      else
      end
    end
    end
  end

end

class Square

  attr_reader :location, :used
  attr_accessor :letter, :directions

  def initialize(location, letter)
    @location = location
    @letter = letter
    @used = false
    @directions = []
    set_directions(location)
  end

  def neighbors?
    neighbor_locations(@location)
  end

  def neighbors_letters?
    neighbors = []
    neighbor_array = neighbor_locations(@location)
  end

  def to_s
    "Location: #{@location}, Letter: #{@letter}, directions: #{@directions}"
  end

  def set_directions(location)  
    @directions = ["LR","UD","SE"] if location == 0 || location == 1 || location == 4 || location == 5
    @directions = ["RL","UD","SW"] if location == 2 || location == 3 || location == 6 || location == 7
    @directions = ["LR","DU","NE"] if location == 8 || location == 9 || location == 12 || location == 13
    @directions = ["RL","DU","NW"] if location == 10 || location == 11 || location == 14 || location == 15
  end
end


board = BoggleBoard.new
board.shake!
puts board
puts "Enter the search value: "
test_value = gets.chomp 
board.search(test_value.upcase)
