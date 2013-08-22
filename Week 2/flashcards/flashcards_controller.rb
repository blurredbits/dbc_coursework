require_relative 'flashcards_model'
require_relative 'flashcards_view'

class Controller

  def initialize(deck = Deck.new, view = View.new)
    @deck = deck
    @deck.load_deck!("flashcard_samples.txt")
    @view = view
    @random_card = @deck.pick_a_card
  end

  def run
    @view.show_home_screen
    push_card_to_view
    @view.show_definition
    @view.get_guess
    return if quit?
    @view.show_feedback
    if check_guess
      @view.clear_definition
      return_results
      @random_card = @deck.pick_a_card
    else
      @view.clear_definition
      return_results
    end
    run
  end

  private

  def push_card_to_view
    @view.definition << @random_card.definition
  end

  def quit?
    @view.guess == 'q'
  end

  def check_guess
    @view.guess == @random_card.answer ? true : false
  end

  def return_results
    check_guess ? @view.show_correct : @view.show_false
  end
end

game = Controller.new
game.run
