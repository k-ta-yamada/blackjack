# Card
class Card
  SUIT = %i[spade club diamond heart].freeze
  RANK = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def disp
    "#{@rank.rjust(2)} : #{@suit}"
  end

  def to_i
    case @rank
    when 'A'           then 1
    when 'J', 'Q', 'K' then 10
    else                    @rank.to_i
    end
  end
end
