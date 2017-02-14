# frozen_string_literal: true
require_relative 'blackjack'

class Player
  attr_accessor :hand, :action, :tally

  def initialize
    @hand = Hand.new
    @tally = 0
    @action = nil
  end

  def decide
    puts

    raise NotImplementedError
  end

  def holding
    raise NotImplementedError
  end

  def won?
    @tally.equal?(1)
  end

  def lost?
    @tally.equal?(-1)
  end

  def draw?
    @tally.equal?(0)
  end

  def win!
    @tally = 1
  end

  def lose!
    @tally = -1
  end

  def draw!
    @tally = 0
  end

  def enter(game:)
    @game = game
    @game.accept(player: self)
  end

  def as_json
    {
      player: {
        tally: tally
      }
        .merge(hand.as_json)
    }
  end
end
