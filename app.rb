require './deck'
require './player'

# Bj
class Bj
  class << self
    def play
      game = new

      puts "== deal inited #{'=' * 30}"

      game.turn_player

      game.turn_dealer

      game.result
    end
  end

  attr_reader :deck, :dealer, :palyer

  def initialize
    @deck = Deck.new
    @deck.shuffle!

    @dealer = Player.new(:dealer)
    2.times { @dealer.hit(@deck.take) }

    @player = Player.new(:player)
    2.times { @player.hit(@deck.take) }

    @dealer.show(mask: true)
    @player.show
  end

  def turn_player
    loop do
      if @player.bust?
        puts '!! BUST !!'
        break
      end

      @player.show

      puts "now [#{@player.total_hand}]. hit or stay? [y/n]"
      break if gets.chomp =~ /n/i

      @player.hit(@deck.take)
    end
  end

  def turn_dealer
    return if @player.bust?
    loop do
      print '.'
      sleep 0.5
      if @dealer.bust?
        puts '!! BUST !!'
        break
      end

      if @dealer.total_hand >= 17
        puts
        break
      end

      @dealer.hit(@deck.take)
    end
  end

  def result
    puts "== RESULT #{'=' * 30}"

    @dealer.show
    @player.show

    puts "\nPLAYER [#{@player.total_hand}] | [#{@dealer.total_hand}] DEALER\n\n"

    puts 'YOU LOSE' if @player.bust?
    puts 'YOU WIN'  if @dealer.bust?
    return if @player.bust? || @dealer.bust?

    if @player.total_hand > @dealer.total_hand
      puts 'YOU WIN'
    elsif @player.total_hand == @dealer.total_hand
      puts 'DRAW'
    else
      puts 'YOU LOSE'
    end
  end
end

Bj.play
