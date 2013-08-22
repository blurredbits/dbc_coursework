class StupidBoggleBoard
  def initialize
    @board = Array.new(16, "-")    
  end
  
  def shake!
    @board.map! { ("A".."Z").to_a.sample }
  end
  
  def to_s
    board_string = ""
    board_string << "Dumb Boogle!\n"
    board_string << "------------\n"
    @board.each_with_index do |spot, index|
      board_string << spot
      board_string << "\n" if (index + 1) % 4 == 0
    end
    board_string << "\n\n"
    board_string
  end
 
end
 
board = StupidBoggleBoard.new
board.shake!
puts board
board.shake!
puts board
 
class SmarterBoggleBoard
  def initialize
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
    @board = []
    @dice_array.each do |die|
      @board << die.sample
    end
  end
  
  def to_s
    board_string = ""
    board_string << "Smart(er)!\n"
    board_string << "------------\n"
    @board.each_with_index do |spot, index|
      if spot == 'Q'
        board_string << "Qu".ljust(3)
      else
        board_string << spot.ljust(3)
      end
      board_string << "\n" if (index + 1) % 4 == 0
    end
    board_string << "\n\n"
    board_string
  end
 
end
 
board = SmarterBoggleBoard.new
board.shake!
puts board
board.shake!
puts board
