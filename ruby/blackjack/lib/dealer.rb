# frozen_string_literal: true

class Dealer
  attr_accessor :hand, :state, :game, :decisions

  include PlayerStates
  include TurnStates
  include Actions

  def initialize
    default_state!
    start_turn!
    @hand = Hand.new
    @decisions = []
  end

  def decide
    decision = if hand.point_total < 17
                 # Stand on 17
                 hit
               elsif hand.bust?
                 turn_done!
                 bust!
               elsif hand.blackjack?
                 turn_done!
                 dealer_blackjack!
               elsif hand.twenty_one?
                 turn_done!
                 twenty_one!
               else
                 turn_done!
                 stand
               end

    decisions.push({ decision: decision, turn_done?: turn_done? }.merge(hand.as_json))

    decision
  end

  def deal_upcard_to(player)
    player.hand.dealt(game.shoe.draw.upcard!)
  end

  def deal_downcard_to(player)
    player.hand.dealt(game.shoe.draw)
  end

  def take_ownership_of(game:)
    @game = game
    game.dealer = self
  end

  def prepare_for_game
    game.shoe = Shoe.new(Deck.new.open)
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
