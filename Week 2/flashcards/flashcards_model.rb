class Card

  attr_reader :definition, :answer

  def initialize(definition, answer)
    @definition = definition
    @answer = answer
  end
end

class Deck

  attr_reader :unanswered_cards
  attr_accessor :answered_cards

  def initialize
    @unanswered_cards = []
    @answered_cards = []
  end

  def load_deck!(filename)
    file_line_array = []
    File.open(filename) do |file|
      file.each_line do |line|
        if line != "\n"
          file_line_array << line.strip
        end
      end
    end
    card_count = file_line_array.size / 2

    card_count.times do |x|
      q_a_array = file_line_array.slice!(0,2)
      @unanswered_cards << Card.new(q_a_array[0], q_a_array[1])
    end
  end

  def pick_a_card
    (@unanswered_cards - @answered_cards).sample
  end

  private

  def card_is_answered(card)
    @answered_cards << card
  end

end
