require_relative 'racer_utils'

class RubyRacer
  attr_reader :players, :length

  def initialize(players, length = 50)
    @players = players
    @length = length
    @die = Die.new
    @winner = nil
    @position = Hash[players.zip(Array.new(players.size) {0})]
  end

  def finished?
    @winner
  end

  def roll
    @die.roll
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    @winner
  end

  # Rolls the dice and advances +player+ accordingly
  def advance_player!(player)
    @position[player] += roll
    if @position[player] >= @length
      @position[player] = @length
      @winner = player
    end
  end

  def print_board
    @players.each do |player|
      print ' |' * @position[player] + player
      print '| ' * (@length - @position[player])
      puts
    end
  end
end

players = ['a', 'b', 'c', 'd']

game = RubyRacer.new(players)

clear_screen!

until game.finished?
  players.each do |player|
    move_to_home!
    game.print_board
    game.advance_player!(player)
    sleep(0.2)
  end
end

puts "Player '#{game.winner}' has won!"
