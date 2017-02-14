# frozen_string_literal: true

class Player
  attr_accessor :hand, :state, :game, :decisions

  def initialize
    @hand = Hand.new
    @state = :undefined
    @decisions = []
    @done = false
  end

  def done?
    @done
  end

  def decide
    decision = if hand.soft? && hand.point_total < 17
                 :hit
               elsif hand.hard? && hand.point_total <= 11
                 :hit
               else
                 @done = true
                 :stand
               end

    decisions.push({ decision: decision, done?: done? }.merge(hand.as_json))

    decision
  end

  def won?
    @state.equal?(:won)
  end

  def lost?
    @state.equal?(:lost)
  end

  def draw?
    @state.equal?(:tied)
  end

  def win!
    @state = :won
  end

  def lose!
    @state = :lost
  end

  def push!
    @state = :tied
  end

  def enter(game:)
    @game = game
    game.accept(player: self)
  end

  def as_json
    dealer_upcard = if game.nil?
                      {}
                    else
                      { game: { dealer: { upcard: game&.dealer&.upcard&.as_json } } }
                     end
    {
      player: {
        state: state,
        decisions: decisions
      }.merge(hand.as_json)
        .merge(dealer_upcard)
    }
  end
end
