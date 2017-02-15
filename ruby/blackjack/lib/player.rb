# frozen_string_literal: true

class Player
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
    decision = if hand.soft? && hand.point_total < 17
                 # Hit on Soft 17
                 hit
               elsif hand.point_total <= 11
                 # Hit on 11
                 hit
               elsif hand.bust?
                 turn_done!
                 bust!
               elsif hand.blackjack?
                 turn_done!
                 blackjack!
               elsif hand.twenty_one?
                 turn_done!
                 twenty_one!
               else
                 turn_done!
                 stand
               end

    decisions.push({
      decision: decision, turn_turn_done?: turn_turn_done?
    }.merge(hand.as_json))

    decision
  end

  def enter(game:)
    @game = game
    game.accept(player: self)
  end

  def as_json
    dealer_upcard = {}.tap do |hash|
      unless game&.dealer&.upcard&.nil?
        hash.merge(game: {
                     dealer: {
                       upcard: game.dealer.upcard.as_json
                     }
                   })
      end
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
