# frozen_string_literal: true

class Dealer
  attr_accessor :hand, :state, :game, :decisions

  def initialize
    @hand = Hand.new
    @state = :unknown
    @decisions = []
    @done = false
  end

  def done?
    @done
  end

  def decide
    decision = if hand.soft? && hand.point_total <= 17
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

  def unknown?
    @state.equal?(:unknown)
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

  def deal_upcard_to(player)
    player.hand.dealt(@game.shoe.draw.upcard!)
  end

  def deal_downcard_to(player)
    player.hand.dealt(@game.shoe.draw)
  end

  def take_ownership_of(game:)
    @game = game
    @game.dealer = self
  end

  def prepare_for_game
    @game.shoe = Shoe.new(Deck.new.open)
  end

  def upcard
    hand.cards.first(&:upcard?)
  end

  def as_json
    {
      dealer: {
        upcard: upcard&.as_json
      }.merge(hand.as_json)
    }
  end
end
