class View
  attr_reader :guess, :definition

  def initialize
    @guess = ""
    @definition = ""
    @result = nil
  end

  def show_home_screen
    puts "Welcome to the Flashcard Game!"
    dot_processing
  end

  def show_definition
    puts "Grabbing definition"
    dot_processing
    puts @definition
    puts "Or press 'q' to quit the game!"
  end

  def get_guess
    puts "\nGuess the definition!"
    @guess = gets.chomp.downcase
  end

  def show_feedback
    puts "\nGuess: #{@guess.capitalize}"
    answer = "mile" #placeholder for model's answer
    puts "\nChecking your guess to the answer"
    dot_processing
  end

  def show_correct
    puts "Correct!"
    sleep(1.0)
    puts "\n"
  end

  def show_false
    puts "Incorrect! Try again."
    sleep(1.0)
    puts "\n"
  end

  def clear_definition
    @definition.clear
  end

  def dot_processing
    10.times {print "..."; sleep(0.1)}
    puts "\n"
  end
end
