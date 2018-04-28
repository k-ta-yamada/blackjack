require './card'

# Deck
class Deck
  attr_reader :deck

  def initialize
    @deck = Card::SUIT.product(Card::RANK).map { |v| Card.new(*v) }
  end

  def shuffle!
    deck.shuffle!
  end

  def take
    @deck.shift
  end
end
