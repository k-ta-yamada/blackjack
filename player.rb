# Person for player and dealer.
class Player
  attr_accessor :name, :hand

  def initialize(name)
    @name = name.to_s
    @hand = []
  end

  def hit(card)
    hand.push(card)
  end

  def show(mask: false)
    puts "-- #{@name} -----"
    hand.each.with_index(1) do |card, i|
      if dealer? && i == 2 && mask
        puts "  [#{i}] *****"
      else
        puts "  [#{i}] #{card.disp}"
      end
    end

    puts "  total: #{dealer? ? total_hand(mask) : total_hand}"
  end

  def bust?
    total_hand > 21
  end

  def dealer?
    @name.to_s == 'dealer'
  end

  def total_hand(mask = false)
    mask ? '*****' : hand.sum(&:to_i)
  end
end
